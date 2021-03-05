function [] = ClueFunc(GameMatrix)
GMAT = GameMatrix;
s = size(GameMatrix);

%Row-Clues
c = s(2);
r = s(1);
if c >= 3
    %2 clues
    rnd = randi(c);
    fprintf('\n%s is to the left of the %s house''s owner',cell2mat(GMAT(1,1)),cell2mat(GMAT(3,2)));
    fprintf('\n%s lies between the %s and the %s house',cell2mat(GMAT(3,2)),cell2mat(GMAT(2,1)),cell2mat(GMAT(2,3)));
end
if c >= 4
    %2 clues
    rnd = randi(c);
    fprintf('\nThe owner of the %s house lives next to the owner of the %s house. %s is not one of them.',cell2mat(GMAT(2,1)),cell2mat(GMAT(2,2)),cell2mat(GMAT(1,3)));
    fprintf('\nThe %s house lies between %s and %s',cell2mat(GMAT(2,3)),cell2mat(GMAT(3,2)),cell2mat(GMAT(3,4)));
end
if c >= 5
    %4 clues
    if r >= 5
        rnd1 = randi(c-1);
        if rnd1 < 2
            rnd1 = 2;
        end
        rnd2 = rnd1 + 1;
        fprintf('\nThe %s lives next to %s. The %s does not drive a %s',cell2mat(GMAT(5,rnd1)),cell2mat(GMAT(3,rnd2)),cell2mat(GMAT(5,rnd1)),cell2mat(GMAT(4,rnd1+1)));
        rnd = randi([2,4]);
        fprintf('\nThe %s, %s, and %s live in a row with the %s in the middle.',cell2mat(GMAT(5,rnd-1)),cell2mat(GMAT(5,rnd)),cell2mat(GMAT(5,rnd+1)),cell2mat(GMAT(5,rnd)));
    end
    fprintf('\n%s lives two houses away from the %s house. %s does not live between them.',cell2mat(GMAT(1,2)),cell2mat(GMAT(2,5)),cell2mat(GMAT(1,1)));
end
if c == 6
    %5 clues
    if r == 6
        rnd = randi(c-1);
        if rnd < 2
            rnd = 2;
        end
        fprintf('\nThe %s year old lives to the left of the %s house',cell2mat(GMAT(6,rnd)),cell2mat(GMAT(2,rnd+1)));
        rnd = randi(c-1);
        if rnd < 2
            rnd = 2;
        end
        fprintf('\nThe %s''s neighbours are %s and %s years old',cell2mat(GMAT(5,rnd)),cell2mat(GMAT(6,rnd-1)),cell2mat(GMAT(6,rnd+1)));
    end
    rnd = randi([2,4]);
    fprintf('\n%s lives to the right of %s. %s lies somewhere in the middle.',cell2mat(GMAT(1,5)),cell2mat(GMAT(3,1)),cell2mat(GMAT(1,rnd)));
    fprintf('\n%s is not next to %s or the %s house.',cell2mat(GMAT(1,3)),cell2mat(GMAT(3,1)),cell2mat(GMAT(2,6)));
end

%Column-Clues
r = s(1);
if r  >= 3
    %2 clues
    rnd = randi(c);
    fprintf('\nThe %s house belongs to %s.',cell2mat(GMAT(2,rnd)),cell2mat(GMAT(1,rnd)));
    rnd = randi(c);
    fprintf('\n%s lives on %s',cell2mat(GMAT(1,rnd)),cell2mat(GMAT(3,rnd)));
end
if r >= 4
    %+2 clues
    rnd = randi(c);
    fprintf('\nThe owner of the %s house drives a %s',cell2mat(GMAT(2,rnd)),cell2mat(GMAT(4,rnd)));
    rnd1 = randi(c);
    rnd2 = randi(c);
    fprintf('\n%s does not live at %s',cell2mat(GMAT(1,rnd1)),cell2mat(GMAT(3,rnd2)));
end
if r >= 5
    %4 clues
    rnd = randi(c);
    fprintf('\n%s works as a %s',cell2mat(GMAT(1,rnd)),cell2mat(GMAT(5,rnd)));
    rnd = randi(c);
    fprintf('\nThe %s lives on %s',cell2mat(GMAT(5,rnd)),cell2mat(GMAT(3,rnd)));
    
end
if r == 6
    %5 clues
    rnd1 = randi(c);
    fprintf('\n%s is %s years old', cell2mat(GMAT(1,rnd1)),cell2mat(GMAT(6,rnd1)));
    rnd1 = randi(c);
    fprintf('\nThe %s is %s years old', cell2mat(GMAT(5,rnd2)),cell2mat(GMAT(6,rnd2)));
end


fprintf('\n\nPlease press ENTER to return to the game. . .');
pause;
clc;
end
