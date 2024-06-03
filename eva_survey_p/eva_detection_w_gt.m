%% Perform evaluation
% Input:
%   gt_line_t                           Detected line segments in the reference image                         
%   test_line                           Detected line segments in the test image
%   eval_param                          Evaluation parameters

% Output:
%   index_pairs                         Matching indexes
%   f1                                  F1_score
%   iou                                 Intersection over Union (IoU)
%   le                                  Location Error
%   le_a                                Orientation Error

function [index_pairs, f1, iou, le, le_a] = eva_detection_w_gt(gt_line_t, test_line, eval_param)

% Perform bidirectional evaluation
[mat_dist_1, mat_angle_1, mat_iou_1]  = eva_unit(gt_line_t, test_line, eval_param);
[mat_dist_2, mat_angle_2, mat_iou_2]  = eva_unit(test_line, gt_line_t, eval_param);

mat_dist                    = (mat_dist_1 + mat_dist_2')      ./ 2;
mat_angle                   = (mat_angle_1 + mat_angle_2')      ./ 2;
mat_iou                     = (mat_iou_1 + mat_iou_2')          ./ 2;

% Find matching relationships (bidirectional constraint, choose the line segment with the largest overlap)
[min_row, idx_row]          = maxk(mat_iou, 2, 1);
index_pairs_1               = [idx_row(1, :); 1:size(mat_iou, 2); min_row(1, :)]';

[min_col, idx_col]          = maxk(mat_iou, 2, 2);
index_pairs_2               = [(1:size(mat_iou, 1))' idx_col(:, 1) min_col(:, 1)];

[~, i1, ~]                  = intersect(index_pairs_1(:, 1:2), index_pairs_2(:, 1:2), 'rows');
index_pairs                 = index_pairs_1(i1, :);

select_dist                 = arrayfun(@(x, y) mat_dist(x, y),  index_pairs(:, 1), index_pairs(:, 2));
select_angles               = arrayfun(@(x, y) mat_angle(x, y), index_pairs(:, 1), index_pairs(:, 2));
index_pairs                 = [index_pairs select_dist select_angles];

invalid_idx                 = (index_pairs(:, 3)    < eval_param.thres_length_ratio) ...
                            | (select_dist          > eval_param.thres_dist) ...
                            | (select_angles        > eval_param.thres_ang); 
index_pairs(invalid_idx, :) = [];

if ~isempty(index_pairs)
    precision               = size(index_pairs, 1)/size(test_line, 1);
    recall                  = size(index_pairs, 1)/size(gt_line_t, 1);
    f1                      = 2 * (precision * recall) ./ (precision + recall);
    iou                     = mean(index_pairs(:, 3));
    le                      = mean(index_pairs(:, 4));
    le_a                    = mean(index_pairs(:, 5));
else
    f1                      = 0;
    iou                     = eval_param.thres_length_ratio;    
    le                      = eval_param.thres_dist;
    le_a                    = eval_param.thres_ang;
end

end