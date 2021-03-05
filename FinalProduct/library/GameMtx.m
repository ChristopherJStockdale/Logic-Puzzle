function [GameMatrix,irow,icol,GMC] = GameMtx(raw)

clc;
raw(:,:);
irow = 'n';
icol = 'n';

clc;

%<SM:RVAL>
%define game-board row dimensions
fprintf('Sherlock Logic Puzzle Game\n\n');
while ~isnumeric(irow)
    irow = str2num(input('Please input the number of rows that you''d like (3-6): ','s'));
    if length(irow) < 1
        irow = num2str(irow);
    end
    if irow < 3
        clc;
        fprintf('Sherlock Logic Puzzle Game\n\n');
        fprintf('Error! This number is too low!\n\nRow number defaulted to 3. . .\n');
        irow = 3;
        pause(2);
    elseif irow > 6
        clc;
        fprintf('Sherlock Logic Puzzle Game\n\n');
        fprintf('Error! This number is too high!\n\nRow number defaulted to 6. . .\n');
        irow = 6;
        pause(2);
    end
end
clc;
fprintf('Sherlock Logic Puzzle Game\n\n');

%define game-board column dimensions
while ~isnumeric(icol)
    icol = str2num(input('Please input the number of columns that you''d like (3-6): ','s'));
    if length(icol) < 1
        icol = num2str(icol);
    end
    if icol < 3
        clc;
        fprintf('Error! This number is too low!\n\nColumn number defaulted to 3. . .\n');
        icol = 3;
        pause(2);
    elseif icol > 6
        clc;
        fprintf('Error! This number is too high!\n\nColumn number defaulted to 6. . .\n');
        icol = 6;
        pause(2);
    end
end
clc;

%<SM:FOR>
sr = size(raw);
if sr(1) == 6
    LR = raw(6,:)
    for k = 1:6
        L = cell2mat(LR(k));
        L = num2str(L);
        LR(k) = {L};
    end
    for k = 1:6
        raw(6,k) = LR(k);
    end
end

%<SM:DIM>
raw = raw(1:irow,1:icol);
GameMtx = raw;

%<SM:SORT>
%randomize game board
GMS = GameMtx;
for r = 1:irow
    s = (randperm(icol));
    for c = 1:icol
        sc = s(c);
        GMS(r,c) =  GameMtx(r,sc);
    end
end
GameMatrix = GMS;

%<SM:SLICE>
%take slice of GMC and convert it to 'hide' answers
GMC(1,1:icol) = {'Name'};
GMC(2,1:icol) = {'House Color'};
GMC(3,1:icol) = {'Street Name'};

%<SM:ROP>
%determine if game-board is larger than smallest set, convert GMC
if irow == 4 || irow > 4
    GMC(4,1:icol) = {'Vehicle'};
end
if irow == 5 || irow == 6
    GMC(5,1:icol) = {'Occupation'};
end
if irow == 6
    GMC(6,1:icol) = {'Age'};
end
end

