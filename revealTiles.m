function [boardForeground] = revealTiles(background, boardForeground, row,col)
%REVEALTILES Reveals the tiles when a click is made
%   This function usually is used just to reveal whatever tile is clicked
%   on. However, if the tile revealed is a 0 tile, it will also reveal any
%   tiles adjacent to it. This is done recursively to reveal all 0 tiles
%   that are touching each other

%tileIndexes
transparent = 1;
t0 = 4;
[rowSize, colSize] = size(boardForeground);

%if it is a 0 tile and not revealed
if background(row,col) == t0 && boardForeground(row,col) ~= transparent
    %nested for loops to reveal the 0 tile and all adjacent tiles
    for i = row-1:row+1
        for j = col-1:col+1
            if (i < 1 || i > rowSize || j < 1 || j > colSize)
                continue
            else
                boardForeground(row,col) = transparent;
                %recursive call
                boardForeground = revealTiles(background, boardForeground, i, j);
                
            end
        end
    end
%if the tile is normal and isn't revealed
elseif (boardForeground(row,col) ~= transparent)
    boardForeground(row,col) = transparent;
end

end

