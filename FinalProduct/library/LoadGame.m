function [GameMatrix,GMC,irow,icol] = LoadGame()

%change directory into function library
clc;
cd('.\library');

%display saves folder contents
SaveDir = ls('.\saves');
Coord = size(SaveDir);
r = Coord(1);
c = Coord(2);
count = 1;

for k = 3:r
    
    
    fprintf('%d. [%s]\n',count,SaveDir(k,:));
    count = count + 1;
    
end

LoChoice = 0;
while LoChoice == 0;
%Define load variable
LoChoice = input('Please enter the number of the saved game that you would like to load: ');
if isempty(LoChoice)
    LoChoice = 0;
end
end
LoChoice = LoChoice+2;
LoChoice = SaveDir(LoChoice,:);
k = 1;


for counter = 1:length(LoChoice)
    
        
    %if LoChoice name is a space remove it from the string
    if ~strcmp(LoChoice(k),' ');
        k = k + 1;
    else
        LoChoice(k) = '';
    end
end

%move to save folder, 
%copy chosen save file to function library,
%perform read using 'getcsv'
%delete save-file copy,
%return to original directory
cd('.\saves');
copyfile(LoChoice,'..\.');
cd('..\.');
[~,~,SaveChoice] = getcsv(LoChoice);
delete(LoChoice);
GMP = size(SaveChoice);
irow = GMP(1);
icol = GMP(2);
GameMatrix = SaveChoice(1:(irow/2),1:icol)
GMC = SaveChoice(((irow/2)+1):end,1:icol)
irow = irow/2;
cd('..\.');
end