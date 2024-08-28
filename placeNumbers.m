function [boardBackground] = placeNumbers(boardBackground)
%PLACENUMBERS Places the numbers on the board
%   Runs through the entire grid and places the appropriate number based on
%   how many bombs the tile is touching.

[row,col] = size(boardBackground);

t0 = 4;
t1 = 5;
t2 = 6;
t3 = 7;
t4 = 8;
t5 = 9;
t6 = 10;
t7 = 11;
t8 = 12;
bomb = 14;

bombCounter = 0;

%first nested double for loops iterate through all the inside tiles that
%aren't edges
for i = 2:row-1
    for j = 2:col-1
        if boardBackground(i,j) ~= bomb
            minRow = i-1;
            maxRow = i+1;
            minCol = j-1;
            maxCol = j+1;
            
            %this nested for loop iterates through all the tiles around the
            %tile to check the number of bombs that they are next to
            for g = minRow:maxRow
                for h = minCol:maxCol
                    if ~isequal([i,j],[g,h])
                        if boardBackground(g,h) == bomb
                            bombCounter = bombCounter + 1;
                        end
                    end
                end
            end

            %place correct tile number according to number of nearby bombs
            if bombCounter == 0
                boardBackground(i,j) = t0;
            elseif bombCounter == 1
                boardBackground(i,j) = t1;
            elseif bombCounter == 2
                boardBackground(i,j) = t2;
            elseif bombCounter == 3
                boardBackground(i,j) = t3;
            elseif bombCounter == 4
                boardBackground(i,j) = t4;
            elseif bombCounter == 5
                boardBackground(i,j) = t5;
            elseif bombCounter == 6
                boardBackground(i,j) = t6;
            elseif bombCounter == 7
                boardBackground(i,j) = t7;
            elseif bombCounter == 8
                boardBackground(i,j) = t8;
            end

            %reset bombCounter for next tile
            bombCounter = 0;
            
            


        end
    end
end

%places numbers for top row not corners
i = 1;
for j = 2:col-1
    if boardBackground(i,j) ~= bomb
        minCol = j-1;
        maxCol = j+1;
        for g = 1:2
            for h = minCol:maxCol
                if ~isequal([i,j], [g, h])
                    if boardBackground(g,h) == bomb
                        bombCounter = bombCounter + 1;
                    end
                end
            end
        end

        if bombCounter == 0
            boardBackground(i,j) = t0;
        elseif bombCounter == 1
            boardBackground(i,j) = t1;
        elseif bombCounter == 2
            boardBackground(i,j) = t2;
        elseif bombCounter == 3
            boardBackground(i,j) = t3;
        elseif bombCounter == 4
            boardBackground(i,j) = t4;
        elseif bombCounter == 5
            boardBackground(i,j) = t5;
        end
        bombCounter = 0;

    end
end


%places numbers for bottom row not corners
i = row;
for j = 2:col-1
    if boardBackground(i,j) ~= bomb
        minCol = j -1;
        maxCol = j+1;
        for g = row - 1:row
            for h = minCol:maxCol
                if ~isequal([i,j], [g, h])
                    if boardBackground(g,h) == bomb
                        bombCounter = bombCounter + 1;
                    end
                end
            end
        end

        if bombCounter == 0
            boardBackground(i,j) = t0;
        elseif bombCounter == 1
            boardBackground(i,j) = t1;
        elseif bombCounter == 2
            boardBackground(i,j) = t2;
        elseif bombCounter == 3
            boardBackground(i,j) = t3;
        elseif bombCounter == 4
            boardBackground(i,j) = t4;
        elseif bombCounter == 5
            boardBackground(i,j) = t5;
        end
        bombCounter = 0;

    end
end


%places numbers for left most column not corners
j = 1;
for i = 2:row-1
    if boardBackground(i,j) ~= bomb
        minRow = i -1;
        maxRow = i+1;
        for g = minRow:maxRow
            for h = 1:2
                if ~isequal([i,j], [g, h])
                    if boardBackground(g,h) == bomb
                        bombCounter = bombCounter + 1;
                    end
                end
            end
        end

        if bombCounter == 0
            boardBackground(i,j) = t0;
        elseif bombCounter == 1
            boardBackground(i,j) = t1;
        elseif bombCounter == 2
            boardBackground(i,j) = t2;
        elseif bombCounter == 3
            boardBackground(i,j) = t3;
        elseif bombCounter == 4
            boardBackground(i,j) = t4;
        elseif bombCounter == 5
            boardBackground(i,j) = t5;
        end
        bombCounter = 0;

    end
end


%places numbers for right most column not corners
j = col;
for i = 2:row-1
    if boardBackground(i,j) ~= bomb
        minRow = i -1;
        maxRow = i+1;
        for g = minRow:maxRow
            for h = col-1:col
                if ~isequal([i,j], [g, h])
                    if boardBackground(g,h) == bomb
                        bombCounter = bombCounter + 1;
                    end
                end
            end
        end

        if bombCounter == 0
            boardBackground(i,j) = t0;
        elseif bombCounter == 1
            boardBackground(i,j) = t1;
        elseif bombCounter == 2
            boardBackground(i,j) = t2;
        elseif bombCounter == 3
            boardBackground(i,j) = t3;
        elseif bombCounter == 4
            boardBackground(i,j) = t4;
        elseif bombCounter == 5
            boardBackground(i,j) = t5;
        end
        bombCounter = 0;

    end
end


%check top left corner
%find what number it should be
i = 1;
j = 1;
if (boardBackground(i,j) ~= bomb)
    for g = 1:2
        for h = 1:2
            if ~isequal([i,j], [g, h])
                if boardBackground(g,h) == bomb
                    bombCounter = bombCounter + 1;
                end
            end
        end
    end
    %place number
    if bombCounter == 0
        boardBackground(i,j) = t0;
    elseif bombCounter == 1
        boardBackground(i,j) = t1;
    elseif bombCounter == 2
        boardBackground(i,j) = t2;
    elseif bombCounter == 3
        boardBackground(i,j) = t3;
    end
    bombCounter = 0;
end

%check top right corner
%find what number it should be
i = 1;
j = col;
if (boardBackground(i,j) ~= bomb)
    for g = 1:2
        for h = col-1:col
            if ~isequal([i,j], [g, h])
                if boardBackground(g,h) == bomb
                    bombCounter = bombCounter + 1;
                end
            end
        end
    end
    %place number
    if bombCounter == 0
        boardBackground(i,j) = t0;
    elseif bombCounter == 1
        boardBackground(i,j) = t1;
    elseif bombCounter == 2
        boardBackground(i,j) = t2;
    elseif bombCounter == 3
        boardBackground(i,j) = t3;
    end
    bombCounter = 0;
end

%check bottom corner
%find what number it should be
i = row;
j = 1;
if (boardBackground(i,j) ~= bomb)
    for g = row-1:row
        for h = 1:2
            if ~isequal([i,j], [g, h])
                if boardBackground(g,h) == bomb
                    bombCounter = bombCounter + 1;
                end
            end
        end
    end
    %place number
    if bombCounter == 0
        boardBackground(i,j) = t0;
    elseif bombCounter == 1
        boardBackground(i,j) = t1;
    elseif bombCounter == 2
        boardBackground(i,j) = t2;
    elseif bombCounter == 3
        boardBackground(i,j) = t3;
    end
    bombCounter = 0;
end

%check bottom right corner
%find what number it should be
i = row;
j = col;
if (boardBackground(i,j) ~= bomb)
    for g = row-1:row
        for h = col-1:col
            if ~isequal([i,j], [g, h])
                if boardBackground(g,h) == bomb
                    bombCounter = bombCounter + 1;
                end
            end
        end
    end
    %place number
    if bombCounter == 0
        boardBackground(i,j) = t0;
    elseif bombCounter == 1
        boardBackground(i,j) = t1;
    elseif bombCounter == 2
        boardBackground(i,j) = t2;
    elseif bombCounter == 3
        boardBackground(i,j) = t3;
    end
    %bombCounter = 0;
end


end

