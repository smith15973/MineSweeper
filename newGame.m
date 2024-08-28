function [boardBackround,boardForeground, rowSize, columnSize] = newGame(difficulty)
%NEWGAME resets everything to make a new game
%   resets the board so that everything is covered and there are no bombs
%   or numbers placed yet

%tile values
tCovered = 2;
t0 = 4;

%get number of rows and columns
[rowSize, columnSize] = boardSize(difficulty);

%resets foreground and background
boardForeground = tCovered*ones(rowSize,columnSize);
boardBackround = t0*ones(rowSize,columnSize);

end

