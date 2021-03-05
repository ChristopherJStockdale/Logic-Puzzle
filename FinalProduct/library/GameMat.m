function [GameMatrix] = GameMat('variables.csv')

clear;
clc;
GameMat = 0;

[~,~,raw] = getcsv('variables.csv');
length(raw)

for k = 1:6
    intstr = num2str(cell2mat(raw(7,k)));
    raw(7,k) = {intstr};    
end


end