function [guess] = gpr6(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('24 | 36 | 42');
if s(2) > 3
    fprintf(' | 51');
end
if s(2) > 4
    fprintf(' | 65');
end
if s(2) > 5
    fprintf(' | 49');
end
guess = 0;
while ~strcmp('24',guess) && ~strcmp('36',guess) && ~strcmp('42',guess) && ~strcmp('51',guess) && ~strcmp('65',guess) && ~strcmp('49',guess)
    guess = input('\n\nYour guess: ', 's');
end
end