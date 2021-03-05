[~,~,raw] = getcsv('variables.csv');

for k = 1:6
    intstr = num2str(cell2mat(raw(7,k)));
    raw(7,k) = {intstr};    
end