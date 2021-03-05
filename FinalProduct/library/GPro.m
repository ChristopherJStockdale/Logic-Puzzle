function [GMC,CorG,ICorG] = GPro(GMC,GameMatrix,guess,gpr,gpc,CorG,ICorG)

gpr = str2num(gpr); %#ok<*ST2NM>

%<SM:STRING>
%compare user's guess to game-board
if strcmp(cell2mat(GameMatrix(gpr,gpc)),guess)
    
    %<SM:AUG>
    %if user's guess is correct, 
    %augment GMC to display correct answer
    GMC(gpr,gpc) = GameMatrix(gpr,gpc);
    CorG = CorG+1;
else
    ICorG = ICorG+1;
end

fprintf('Press ENTER to continue. . .');
pause;

end
