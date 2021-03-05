function [guess] = gpr3(GMC)

%collect user input and convert it into a common variable 
%(i.e.) - convert 'h' or 'holmes' to 'Holmes' for guess matching
s = size(GMC);
fprintf('\n\nPossible Guesses: ');
fprintf('Baker Street | Charterhouse Square | St. Mary Meade Street');
if s(2) > 3
    fprintf(' | Fleet Street');
end
if s(2) > 4
    fprintf(' | Whitechapel Street');
end
if s(2) > 5
    fprintf(' | Thames Street');
end
guess = input('\n\nYour guess: ', 's');
switch guess
    case {'B','b','Baker','baker'}
        guess = 'Baker Street';
    case {'C','c','Charterhouse','charterhouse'}
        guess = 'Charterhouse Square';
    case {'S','s','St. Mary Meade','st. mary meade','st','st.','St.','St'}
        guess = 'St. Mary Meade Street';
    case {'Fleet Street','Fleet','fleet','F','f'}
        guess = 'Fleet Street';
    case {'Whitechapel','whitechapel','W','w'}
        guess = 'Whitechapel Street';
    case {'Thames Street','thames street','Thames','thames','t','T'}
        guess = 'Thames Street';
    otherwise
        %display error message
        fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
        fprintf('\nPress ENTER to continue. . .');
        pause;
end
end