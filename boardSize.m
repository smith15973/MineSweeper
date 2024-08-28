function [numRows,numCols] = boardSize(difficulty)
%BOARDSIZE creates board size
%   This function returns the number of columns and rows based on the
%   difficulty passed in that the user chose

%advanced
if difficulty == 3
    numRows = 16;
    numCols = 30;
%intermediate
elseif difficulty == 2
    numRows = 16;
    numCols = 16;
%beginner
elseif difficulty == 1
    numRows = 9;
    numCols = 9;
end
end