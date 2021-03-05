%<SM:AFFIRM>
% ------------------------------
% Submitted by: Christopher Stockdale
%
% Credit to: Prof Kindy, Joseph Ayd, and Sources
% A special thanks to the above for a great class
%
% I affirm that the creation and modification
% of this submission is my own work
% ------------------------------


close all;

clear;

clc;

%add game files to path
addpath('.\library');

addpath('.\library\saves');

%<SM:READ>
[~,~,raw] = getcsv('variables.csv');

%Create variable to begin loop
M1choice = 0;
gmen = 0;
guess = 0;
CorG = 0;
ICorG = 0;
TotG = 0;

%<SM:WHILE>
%repeat until the user exits the game
while M1choice ~= 'x'
    
    %define loop variables
    CorG = 0;
    ICorG = 0;
    TotG = 0;
    M1choice = 0;
    gmen = 0;
    guess = 0;
    
    %<SM:PDF_CALL>
    %Create/display main menu
    [M1choice] = MainMenuFunc();
    
    %<SM:IF>
    %test if user wants to begin a new game.
    if M1choice == 'N' || M1choice == 'n' || M1choice == '1'
        
        %define M1choice by a more common variable
        M1choice = 'n';
        
        %Create game board from 'variables.csv'
        [GameMatrix,irow,icol,GMC] = GameMtx(raw);
        gcount = 0;
        
        %<SM:NEST>
        %allow user to quit game
        while gmen ~= 'q'
            
            %<SM:PDF_PARAM>
            %display in-game menu and collect user game input
            [gmen] = InGameFunc(irow,icol,GMC,GameMatrix,ICorG,CorG,TotG);
            
            %<SM:PDF_RETURN>
            %test if user wants to make a guess, then collect and process
            %the guess
            if gmen == 'g'
                [guess,gpr,gpc] = GuessFunc(irow,icol,GMC);
                if guess ~= 0;
                    [GMC,CorG,ICorG] = GPro(GMC,GameMatrix,guess,gpr,gpc,CorG,ICorG);
                    
                    %<SM:RTOTAL>
                    %collect user score so far
                    TotG = ICorG + CorG;
                end
                gcount = gcount + 1;
                
                %if user has completed a game, show end-game display
            elseif gmen == 'f'
                %call end-game function
                FuncyTown(CorG,TotG);
                gmen = 'q';
                pause;
                
            end
            
        end
        
        %<SM:BOP>
        %allow user to load a previously saved-game
    elseif M1choice == 'l' || M1choice == 'L' || M1choice == '2'
        
        %call LoadGame function
        M1choice = 'l';
        clc;
        [GameMatrix,GMC,irow,icol] = LoadGame();
        gcount = 0;
        
        %from newly loaded game, allow user to finish their game or save
        %and exit.
        while gmen ~= 'q'
            [gmen] = InGameFunc(irow,icol,GMC,GameMatrix,ICorG,CorG,TotG);
            if gmen == 'g'
                [guess,gpr,gpc] = GuessFunc(irow,icol,GMC);
                if guess ~= 0;
                    [GMC,CorG,ICorG] = GPro(GMC,GameMatrix,guess,gpr,gpc,CorG,ICorG);
                    TotG = ICorG + CorG;
                end
                gcount = gcount + 1;
            elseif gmen == 'f'
                FuncyTown(CorG,TotG);
                gmen = 'q';
                pause;                
            end            
        end
        
        
    elseif M1choice == 'T' || M1choice == 't' || M1choice == '3'
        %display tutorial
        clc;
        fprintf(' Tutorial');
        fprintf('\n(to skip, press ENTER)');        
        fprintf(['\n\nWelcome to Sherlock, the logic puzzle game.\n\n' ...
            'The objective of the game is to fill in the game board using clues provided while making as few errors as possible.\n' ...
            'To navigate through the game and its menus, the player must input an option, usually a number or letter, and press the enter key.\n\n' ...
            'As the names in the game can sometimes be long, when typing in a guess you may use only the first letter.\n'...
            'Example: To guess that the name of the first suspect is "Marple" the player would type "m" and press enter.\n\n'...
            'If you require help at any point, enter the "h" option for a table of acceptable commands.\n'...
            'To continue, press ENTER...']);
        pause;
        
        
    elseif M1choice == 'x' || M1choice == 'X' || M1choice == '4' || M1choice == 'E' || M1choice == 'e'
        % allow user to exit the program
        clc;
        M1choice = 'x';
        fprintf('Thanks for playing!');
        pause(2);
        clc;
        
        
    elseif M1choice == 'h' || M1choice == 'H'
        %display help menu
        clc;
        fprintf('HELP\n\n');
        fprintf(['For a new game, enter the "N" or "1" key.\n\n' ...
            'To load a saved game, enter the "L" or "2" key.\n\n' ...
            'To show the game tutorial, enter the "T" or "3" key\n\n'...
            'To exit, enter the "X" or "4" key.\n\n' ...
            'For program information, press the "4" or "B" key.\n\n']);
        fprintf('Press ENTER to continue...');
        pause;
        
        
    else
        % display error message
        fprintf('Unfortunately, that input is inappropriate.\n\n');
        fprintf('Please press ENTER to return to the main menu. . .');
        pause;
    end
end