result_path = '../result/';
files = dir([result_path 'final_prediction']);
files(1:2)=[];
cmb = {};
T = 0.85;
for i = 1:length(files)
    load([result_path 'final_prediction/' num2str(i) '_prediction.mat']);
    load([result_path 'score_map_cands/' num2str(i) '_cand.mat']);
    pred = find(prediction>T);
    pos = center(pred,:);
    dummy = [];
    for k = 1:size(pos,1)
        for l = k+1:size(pos,1)
            distance = norm((pos(k,:)-pos(l,:)),2);
            if distance < 10
                dummy = [dummy k];
            end
        end
    end
    pos(dummy,:)=[];
    cmb{i} = pos;
end
save('../result/detection.mat','cmb');
