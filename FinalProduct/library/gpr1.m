function [guess] = gpr1(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('Holmes | Poirot | Marple');
if s(2) > 3
    fprintf(' | Lestrade');
end
if s(2) > 4
    fprintf(' | Wimsey');
end
if s(2) > 5
    fprintf(' | Brown');
end
guess = input('\n\nYour guess: ', 's');
switch guess
    case {'Holmes','holmes','H','h'}
        guess = 'Holmes';
    case {'Poirot','poirot','P','p'}
        guess = 'Poirot';
    case {'Marple','marple','M','m'}
        guess = 'Marple';
    case {'Lestrade','lestrade','L','l'}
        guess = 'Lestrade';
    case {'Wimsey','wimsey','W','w'}
        guess = 'Wimsey';
    case {'Brown','brown','B','b'}
        guess = 'Brown';
    otherwise
        %display error message
        fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
        fprintf('\nPress ENTER to continue. . .');
        pause;
end
end