clear;clc;
addpath('./post_processing');
addpath('./lib/MinMaxFilterFolder');
result_path = '../result/';

%% get score
dimx = 16;
dimy = 16;
dimz = 10;
threshold_score_mask = 0.64;
get_score_map_cand(result_path,dimx,dimy,dimz,threshold_score_mask);


%% patches
dimx = 20;
dimy = 20;
dimz = 16;
get_datasets_final_pred(result_path,dimx,dimy,dimz);