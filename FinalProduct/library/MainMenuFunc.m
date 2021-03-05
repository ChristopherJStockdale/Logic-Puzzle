function [M1choice] = MainMenuFunc()

%Display menu
M1choice = 0;
while M1choice == 0;
    clc;
    fprintf('Sherlock Logic Puzzle Game\n');
    fprintf('\n\t1. New Game');
    fprintf('\n\n\t2. Load Game');
    fprintf('\n\n\t3. Show Tutorial');
    fprintf('\n\n\t4. Exit Game\n\n');
    
    %collect user menu choice
    M1choice = input('What would you like to do? ', 's');
    if isempty(M1choice)
        M1choice = 0;
    end
end
end