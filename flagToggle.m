function [board, numOfFlags] = flagToggle(board, row, col, numOfFlags)
%FLAGTOGGLE Toggles the flag on or off accordingly
%   Based on the row and column of the tile, this will either place or take
%   away a flag. It will place a flag if the tile is currently covered with
%   no flag and will remove a flag if the tile currently has a flag

covered = 2;
flag = 3;

%flags it if its not flagged and unflag if it is
if (board(row,col) == covered)
    board(row,col) = flag;
    numOfFlags = numOfFlags - 1;
elseif (board(row,col) == flag)
    board(row,col) = covered;
    numOfFlags = numOfFlags + 1;
else
    
end

end

