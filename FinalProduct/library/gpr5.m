function [guess] = gpr5(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('Chemist | Policeman | Inheritor');
if s(2) > 3
    fprintf(' | Detective');
end
if s(2) > 4
    fprintf(' | Soldier');
end
if s(2) > 5
    fprintf(' | Friar');
end
guess = input('\n\nYour guess: ', 's');
switch guess
    case {'Chemist','chemist','C','c'}
        guess = 'Chemist';
    case {'Policeman','policeman','P','p'}
        guess = 'Policeman';
    case {'Inheritor','inheritor','I','i'}
        guess = 'Inheritor';
    case {'Detective','detective','D','d'}
        guess = 'Detective';
    case {'Soldier','soldier','S','s'}
        guess = 'Soldier';
    case {'Friar','friar','F','f'}
        guess = 'Friar';
    otherwise
        %display error message
        fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
        fprintf('\nPress ENTER to continue. . .');
        pause;
end
end