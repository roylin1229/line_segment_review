%% Evaluate Descriptor Performance
% Input:
%   test_img                    Test image
%   ref_img                     Reference image
%   test_kl                     Detected line segments and descriptors in the test image
%   ref_kl                      Detected line segments and descriptors in the reference image
%   H                           Homography matrix between the test image and reference image
%   eval_param                  Evaluation parameters
%   is_bin_desc                 Whether the descriptor is binary

% Output:
%   recall                      Recall rate
%   precision                   Precision rate
%   match_num                   Number of matches
%   index_pairs_desc_v          Correct match indices
%   index_pairs_desc            Descriptor match indices
%   ref_lines                   Valid line segments in the reference image used for evaluation
%   test_lines                  Valid line segments in the test image used for evaluation

function [recall, precision, match_num, index_pairs_desc_v, index_pairs_desc, ref_lines, test_lines] = eva_desc(test_img, ref_img, test_kl, ref_kl, H, eval_param, is_bin_desc)

ref_kl_loc           = [vertcat(ref_kl.kl.startPoint)  vertcat(ref_kl.kl.endPoint)] + 1;
test_kl_loc          = [vertcat(test_kl.kl.startPoint) vertcat(test_kl.kl.endPoint)] + 1;
ref_desc             = ref_kl.desc;
test_desc            = test_kl.desc;

if size(ref_kl_loc, 1) > 0
    [ref_lines, ref_lines_t, ref_desc]      = process_results_desc(ref_kl_loc, test_img, ref_desc, H);
else
    ref_lines_t                             = double.empty(0, 8);
    ref_lines                               = double.empty(0, 8);
end

if size(test_kl_loc, 1) > 0
    [test_lines, ~, test_desc]              = process_results_desc(test_kl_loc, ref_img, test_desc, inv(H));
else
    test_lines                              = double.empty(0, 8);
end

%% Set parameters for line segment detection evaluation
[index_pairs]                   = eva_detection_wo_gt(ref_lines_t, test_lines, eval_param);

%% Perform bidirectional matching + brute force matching
if is_bin_desc
    matcher                     = DescriptorMatcher('BFMatcher', 'NormType', 'Hamming', 'CrossCheck', true);
    matches                     = matcher.match(ref_desc, test_desc);
else
    matcher                     = DescriptorMatcher('BFMatcher', 'NormType', 'L2', 'CrossCheck', true);
    matches                     = matcher.match(ref_desc, test_desc);
end

index_pairs_desc                = [[matches.queryIdx]', [matches.trainIdx]'];
index_pairs_desc                = index_pairs_desc + 1;

% Calculate evaluation results
[recall, precision, match_num, index_pairs_desc_v]  = statistic_unit(index_pairs, index_pairs_desc);

end