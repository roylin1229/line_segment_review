% Line Segment Detection Evaluation Demo with Manually Labeled Ground Truth of Line Segments
clc; clearvars; close all; addpath('./eva_survey_p/');

% Load testing image and line segments. Each line segment is defined by [x1 y1 x2 y2],
% where (x1, y1) is the start point and (x2, y2) is the end point.
est_img                         = imread('./test_data_with_gt/00031546.jpg');
gt_line                         = load('./test_data_with_gt/00031546_line_gt.mat').lines;
test_line                       = load('./test_data_with_gt/00031546.mat').lines;

% Evaluation parameters
eval_param.thres_dist           = 5;
eval_param.thres_ang            = 20;
eval_param.thres_length_ratio   = 0.5;

% Format transformation
[gt_line, gt_line_t]            = process_results(gt_line,  est_img,  eye(3));
[test_line, ~]                  = process_results(test_line, est_img,  eye(3));

% Perform evaluation
[index_pairs, f1, iou, le, le_a] = eva_detection_w_gt(gt_line_t, test_line, eval_param);

%% Visualization
figure
set(gcf,'outerposition',get(0,'screensize'));

% Display ground truth and detected line segments in the test image
subplot(121)
imshow(est_img)
hold on
line([gt_line(:, 1) gt_line(:, 3)]', [gt_line(:, 2) gt_line(:, 4)]', 'Color', 'g')
hold on
line([test_line(:, 1) test_line(:, 3)]', [test_line(:, 2) test_line(:, 4)]', 'Color', 'r')
title({'Ground Truth Line Segments (Green)', 'and Detected Line Segments (Red) in the Test Image'});

% Display matched line segments
subplot(122)
imshow(est_img)
hold on
line([gt_line_t(index_pairs(:, 1), 1) gt_line_t(index_pairs(:, 1), 3)]', [gt_line_t(index_pairs(:, 1), 2) gt_line_t(index_pairs(:, 1), 4)]', 'Color', 'g')
hold on
line([test_line(index_pairs(:, 2), 1) test_line(index_pairs(:, 2), 3)]', [test_line(index_pairs(:, 2), 2) test_line(index_pairs(:, 2), 4)]', 'Color', 'r')
title('Matched Line Segments');