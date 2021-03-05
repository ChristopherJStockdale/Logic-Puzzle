function [gmen] = InGameFunc(irow,icol,GMC,GameMatrix,ICorG,CorG,TotG)

%define loop variable
winf = 0;

%search through the matrix for remaining "concealed" elements
%if none are detected, begin end-game.
for r = 1:irow
    for c = 1:icol
        
        %<SM:SEARCH>
        switch cell2mat(GMC(r,c))
            case 'Name'
                winf = 0;
            case 'House Color'
                winf = 0;
            case 'Street Name'
                winf = 0;
            case 'Vehicle'
                winf = 0;
            case 'Occupation'
                winf = 0;
            case 'Age'
                winf = 0;
            otherwise
                winf = winf + 1;
        end
    end
end
clc;

%display game board
fprintf('Sherlock Logic Puzzle Game\n');
for r = 1:irow
    fprintf('\n');
    for c = 1:icol
        fprintf('%-20s\t',cell2mat(GMC(r,c)));
    end
end

%Display in-game menu and collect user choice
if winf < 4
    fprintf('\n\n1. Guess | 2. Save Game | 3. Display Clues | 4. Quit Game \t\tCorrect Guesses:%d\tIncorrect Guesses:%d\t Total Guesses:%d',CorG,ICorG,TotG);
    gmen = input('\nWhat would you like to do? ', 's');
    switch (gmen)
        
        %if user wishes to guess, switch gmen to 'g'
        case {'1','G','g'}
            gmen = 'g';
        case {'2','S','s'}
            gmen = 's';
            SaveGame(irow,icol,GMC,GameMatrix);
            fprintf('\nPress ENTER to continue. . .');
            pause;
            
            %if user wishes to display clues,
            %call clue function
        case{'3','D','d','C','c'}
            ClueFunc(GameMatrix);
            
            %display help menu
        case {'H','h'}
            clc;
            fprintf('HELP\n\n');
            fprintf(['To make a guess, enter the "G" or "1" key.\n\n' ...
                'To save your game, enter the "S" or "2" key.\n\n' ...
                'To display clues, enter the "D" or "3" key.\n\n' ...
                'To exit back to the main menu, enter the "Q", or "4" key.\n\n']); ...
                fprintf('Press ENTER to continue...');
            pause;
            
            %display 'quit game' choice
        case {'4','Q','q'}
            sgmen = 0;
            while sgmen == 0;
                sgmen = input('Would you like to save your game(y/n)? ','s');
                if isempty(sgmen)
                   fprintf('Unfortunately, that is not an appropriate selection.\n');
                   sgmen = 0;
                end                
                %allow user to save before quitting
                if sgmen == 'Y' || sgmen == 'y'
                    sgmen = 'y';
                    clc;
                    SaveGame(irow,icol,GMC,GameMatrix);
                    fprintf('Thanks for playing!\nTo return to the Main Menu press ENTER. . .\n');
                    gmen = 'q';
                    pause;
                    
                    %allow user to quit without saving
                elseif sgmen == 'N' || sgmen == 'n'
                    clc;
                    sgmen = 'n';
                    gmen = 'q';
                    fprintf('Thanks for playing!\nTo return to the Main Menu press ENTER. . .\n');
                    pause;
                end
            end
        otherwise
            
            %display error message
            fprintf('Unfortunately, that is an inappropriate input. For help, enter ''h''');
            fprintf('\nPress ENTER to continue. . .');
            gmen = 0;
            pause;
    end
    
    %define end-game variable
elseif winf >= 4
    gmen = 'f';
end
end