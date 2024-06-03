% Line Segment Description Evaluation Demo without Ground Truth Line Segments
clc; clearvars; close all; addpath('./eva_survey_p/');

% Load the reference and test images and detected line segments with corresponding descriptors
ref_kl                           = load('./test_data_without_gt/1_LSD_LBD.mat').data;
ref_img                          = imread('./test_data_without_gt/1.ppm');
test_kl                          = load('./test_data_without_gt/4_LSD_LBD.mat').data;
test_img                         = imread('./test_data_without_gt/4.ppm');

% Load the 3x3 Homography matrix
H                               = readmatrix('./test_data_without_gt/H_1_4');

% Perform evaluation
eval_param.thres_dist           = 3;
eval_param.thres_ang            = 10;
eval_param.thres_length_ratio   = 0.75;     % .75 (Con1) or .5 (Con2)

[recall, precision, match_num, index_pairs_desc_v, index_pairs_desc, ref_lines, test_lines] = eva_desc(test_img, ref_img, test_kl, ref_kl, H, eval_param, 0);

% Visualization
figure
set(gcf,'outerposition',get(0,'screensize'));

subplot(231)
imshow(ref_img)
hold on
line([ref_lines(:, 1) ref_lines(:, 3)]', [ref_lines(:, 2) ref_lines(:, 4)]', 'Color', 'g')
title('Detected line segments in the reference image')

subplot(234)
imshow(test_img)
hold on
line([test_lines(:, 1) test_lines(:, 3)]', [test_lines(:, 2) test_lines(:, 4)]', 'Color', 'r')
title('Detected line segments in the test image')

subplot(2,3,[2 3])
ref_pts  = (ref_lines(index_pairs_desc(:, 1), 1:2)  + ref_lines(index_pairs_desc(:, 1), 3:4)) ./ 2;
test_pts = (test_lines(index_pairs_desc(:, 2), 1:2) + test_lines(index_pairs_desc(:, 2), 3:4)) ./ 2;
showMatchedFeatures(ref_img, test_img, ref_pts, test_pts, 'montage');
hold on
line([ref_lines(index_pairs_desc(:, 1), 1) ref_lines(index_pairs_desc(:, 1), 3)]', ...
     [ref_lines(index_pairs_desc(:, 1), 2) ref_lines(index_pairs_desc(:, 1), 4)]', 'Color', 'g')
hold on
line([test_lines(index_pairs_desc(:, 2), 1)+size(ref_img, 2) test_lines(index_pairs_desc(:, 2), 3)+size(ref_img, 2)]', ...
     [test_lines(index_pairs_desc(:, 2), 2)                  test_lines(index_pairs_desc(:, 2), 4)]', 'Color', 'r')
title('Matched line segments according to descriptor similarity')

subplot(2,3,[5 6])
ref_pts  = (ref_lines(index_pairs_desc_v(:, 1), 1:2)  + ref_lines(index_pairs_desc_v(:, 1), 3:4)) ./ 2;
test_pts = (test_lines(index_pairs_desc_v(:, 2), 1:2) + test_lines(index_pairs_desc_v(:, 2), 3:4)) ./ 2;
showMatchedFeatures(ref_img, test_img, ref_pts, test_pts, 'montage');
hold on
line([ref_lines(index_pairs_desc_v(:, 1), 1) ref_lines(index_pairs_desc_v(:, 1), 3)]', ...
     [ref_lines(index_pairs_desc_v(:, 1), 2) ref_lines(index_pairs_desc_v(:, 1), 4)]', 'Color', 'g')
hold on
line([test_lines(index_pairs_desc_v(:, 2), 1)+size(ref_img, 2) test_lines(index_pairs_desc_v(:, 2), 3)+size(ref_img, 2)]', ...
     [test_lines(index_pairs_desc_v(:, 2), 2)                  test_lines(index_pairs_desc_v(:, 2), 4)]', 'Color', 'r')
title('Valid line segment matches according to homography constraint')
