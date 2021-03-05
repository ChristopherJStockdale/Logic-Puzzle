function [guess,gpr,gpc] = GuessFunc(irow,icol,GMC)
clc;
gpc = 0;
gpr = 0;
guess = 0;

%repeat until user provides an appropriate input
while guess == 0
    fprintf('Sherlock Logic Puzzle Game\n\n');
    fprintf('\n');
    for c = 1:icol
        fprintf('%-20d\t',c);
    end
    
    %display menu
    for r = 1:irow
        fprintf('\n');
        for c = 1:icol
            fprintf('%-20s\t',cell2mat(GMC(r,c)));
        end
    end
    
    %collect and valid user's input for 'gpc' variable
    while gpc <= 0 || strcmp(gpc,'H') || strcmp(gpc,'h')
        gpc = input('\nWhich column would you like to guess(i.e. first, second, etc.)? ');
        if isempty(gpc)
            gpc = 0;
        end
        if strcmp(gpc,'H') || strcmp(gpc,'h')
            GuessHelp()
        end
    end
    
    %<SM:VALID>
    %collect and valid user's input for 'gpr' variable
    while gpr <= 0 || isempty(gpr) || strcmp(gpr,'H') || strcmp(gpr,'h')
        gpr = input('What would you like to guess (i.e. Name, House color, etc.)? ', 's');
        if isempty(gpr)
            gpr = 0;
        end
        if strcmp(gpr,'H') || strcmp(gpr,'h')
            GuessHelp()
        end
    end
    
    clc;
    fprintf('Sherlock Logic Puzzle Game\n\n');
    for c = 1:icol
        fprintf('%-20d\t',c);
    end
    for r = 1:irow
        fprintf('\n')
        for c = 1:icol
            fprintf('%-20s\t',cell2mat(GMC(r,c)));
        end
    end
    
    
    %<SM:SWITCH>
    %switch user guess with commonly accepted string(i.e. 'Holmes' vs.
    %'holmes'
    switch gpr
        case {'1','N','n','Name','name'}
            guess = gpr1(GMC);
            
        case {'2','H','h','c','C','House Color','house color'}
            guess = gpr2(GMC);
            
        case {'3','S','s','Street Name','street name'}
            guess = gpr3(GMC);
            
        case {'4','V','v','Vehicle','vehicle'}
            guess = gpr4(GMC);
            
        case {'5','O','o','Occupation','occupation'}
            guess = gpr5(GMC);
            
        case {'6','A','a','Age','age'}
            guess = gpr6(GMC);
            
        otherwise
            %display error message
            fprintf('\n\nSorry, that is an inappropriate input.\nFor help, enter ''h''');
            fprintf('\n\nPlease press ENTER to return to the guess menu. . .');
            pause();
            clc;
            gpr = 0;
            gpc = 0;
    end
    
end
end