function [guess] = gpr5(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('Covertible | Sports Car | Limousine');
if s(2) > 3
    fprintf(' | Truck');
end
if s(2) > 4
    fprintf(' | Van');
end
if s(2) > 5
    fprintf(' | Hybrid');
end
guess = input('\n\nYour guess: ', 's');
switch guess
    case {'C','c','Convertible','convertible'}
        guess = 'Convertible';
    case {'Sports Car','sports car','S','s'}
        guess = 'Sports Car';
    case {'Limousine','limousine','L','l'}
        guess = 'Limousine';
    case {'Truck','truck','T','t'}
        guess = 'Truck';
    case {'Van','van','V','v'}
        guess = 'Van';
    case {'Hybrid','hybrid','H','h'}
        guess = 'Hybrid';
    otherwise
        %display error message
        fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
        fprintf('\nPress ENTER to continue. . .');
        pause;
end
end