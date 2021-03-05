function [guess] = gpr2(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('Red | Orange | Yellow');
if s(2) > 3
    fprintf(' | Green');
end
if s(2) > 4
    fprintf(' | Blue');
end
if s(2) > 5
    fprintf(' | Violet');
end
guess = input('\n\nYour guess: ', 's');
switch guess
    case {'Red','red','R','r'}
        guess = 'Red';
    case {'Orange','orange','O','o'}
        guess = 'Orange';
    case {'Yellow','yellow','Y','y'}
        guess = 'Yellow';
    case {'Green','green','G','g'}
        guess = 'Green';
    case {'Blue','blue','B','b'}
        guess = 'Blue';
    case {'Violet','violet','V','v'}
        guess = 'Violet';
    otherwise
        %display error message
        fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
        fprintf('\nPress ENTER to continue. . .');
        pause;
end
end