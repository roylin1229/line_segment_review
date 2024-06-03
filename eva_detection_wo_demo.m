% Line Segment Detection Evaluation Demo without Ground Truth Line Segments
clc; clearvars; close all; addpath('./eva_survey_p/');

% Load the reference and test images and detected line segments
% Each line segment is defined by [x1 y1 x2 y2], where (x1, y1) is the start point and (x2, y2) is the end point
ref_line                        = load('./test_data_without_gt/1.mat').lines;
ref_img                         = imread('./test_data_without_gt/1.ppm');
test_line                       = load('./test_data_without_gt/4.mat').lines;
test_img                        = imread('./test_data_without_gt/4.ppm');

% Load the 3x3 Homography matrix
H                               = readmatrix('./test_data_without_gt/H_1_4');

% Evaluation parameters
eval_param.thres_dist           = 3;
eval_param.thres_ang            = 10;
eval_param.thres_length_ratio   = 0.75;

% Format transformation
[ref_line, ref_line_t]           = process_results(ref_line,  test_img, H);
[test_line, ~]                   = process_results(test_line, ref_img,  inv(H));

% Perform evaluation
[index_pairs, rep, iou, le, le_a] = eva_detection_wo_gt(ref_line_t, test_line, eval_param);

%% Visualization
figure
set(gcf,'outerposition',get(0,'screensize'));
% Display detected line segments in the reference image
subplot(221)
imshow(ref_img)
hold on
line([ref_line(:, 1) ref_line(:, 3)]', [ref_line(:, 2) ref_line(:, 4)]', 'Color', 'g')
title('Detected Line Segments in the Reference Image');

% Display detected line segments in the test image
subplot(222)
imshow(test_img)
hold on
line([test_line(:, 1) test_line(:, 3)]', [test_line(:, 2) test_line(:, 4)]', 'Color', 'r')
title('Detected Line Segments in the Test Image');

% Display matched line segments between the reference and test images
subplot(2,2,[3, 4])
imshow(test_img)
hold on
line([ref_line_t(index_pairs(:, 1), 1) ref_line_t(index_pairs(:, 1), 3)]', [ref_line_t(index_pairs(:, 1), 2) ref_line_t(index_pairs(:, 1), 4)]', 'Color', 'g')
hold on
line([test_line(index_pairs(:, 2), 1) test_line(index_pairs(:, 2), 3)]', [test_line(index_pairs(:, 2), 2) test_line(index_pairs(:, 2), 4)]', 'Color', 'r')
title('Matched Line Segments between the Reference and Test Images');
