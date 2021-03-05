function [] = FuncyTown(CorG,TotG)

%show end-game display
clc;
gamescore = (CorG/TotG)*100;
fprintf('YOU WIN!')
fprintf('\nYour score was: %.0f out of 100', gamescore);
fprintf('\n\nPlease press ENTER to return to the Main Menu. . .');
pause;
end