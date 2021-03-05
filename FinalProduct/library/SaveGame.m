function [] = SaveGame(irow,icol,GMC,GameMatrix)

%define loop variable
ErrorCode = 1;

%repeat while loop variable is unchanged
while ErrorCode == 1;
    
    %<SM:WRITE>
    %save game by creating a new .csv file with the user's desired name
    SGName = input('Please enter a name for your save file: ', 's');
    SGN = sprintf('save_%s.csv',SGName);
    successful_write = putcsv(SGN,[GameMatrix;GMC]);
    
    if ~isempty(SGName) && successful_write
        %display successful save message
        fprintf('\nGame saved\n');
        movefile(SGN,'.\library\saves');
        ErrorCode = 0;
    else
        %display save failure message
        %if this fails, there's nothing the user can really do.
        fprintf(['\nFailure to write.' ...
            '\nPlease try again with another file name.\n']);
        pause(1);
    end
    
end
end