function board = placeBombs(board, difficulty, rowClicked, columnClicked, numBombs)
%PLACEBOMB places the bombs on the board
%   places the bombs on the background board based on the difficulty. 99
%   for hard, 40 for medium, 10 for easy. There is a check to make sure
%   that bombs are not placed on teh first intital click tile, or any
%   adjacent tiles

rng("shuffle");

bombsPlaced = 0;
bombTile = 14;

[rows,columns] = size(board);




%advanced board has 99 bombs
if difficulty == 3
    while bombsPlaced < numBombs
        %get the random location of bomb placement
        randomRow = randi(rows);
        randomColumn = randi(columns);
        location = [randomRow, randomColumn];

        %check to make sure that the bomb is not being placed on or near
        %the first click
        isBombable = bombableCheck(rowClicked,columnClicked, location);
        
        %places bomb if there is not already a bomb and it is not one of
        %the tiles attatched to the first click
        if (board(randomRow, randomColumn) ~= bombTile) && isBombable
            board(randomRow, randomColumn) = bombTile;
            bombsPlaced = bombsPlaced + 1;
        end
    end


%intermediate board has 40 bombs
elseif difficulty == 2
    while bombsPlaced < numBombs
        %get the random location of bomb placement
        randomRow = randi(rows);
        randomColumn = randi(columns);
        location = [randomRow, randomColumn];

        %check to make sure that the bomb is not being placed on or near
        %the first click
        isBombable = bombableCheck(rowClicked,columnClicked, location);
        
        %places bomb if there is not already a bomb and it is not one of
        %the tiles attatched to the first click
        if (board(randomRow, randomColumn) ~= bombTile) && isBombable
            board(randomRow, randomColumn) = bombTile;
            bombsPlaced = bombsPlaced + 1;
        end
    end


%beginner board has 10 bombs
elseif difficulty == 1
    while bombsPlaced < numBombs
        %get the random location of bomb placement
        randomRow = randi(rows);
        randomColumn = randi(columns);
        location = [randomRow, randomColumn];

        %check to make sure that the bomb is not being placed on or near
        %the first click
        isBombable = bombableCheck(rowClicked,columnClicked, location);
        
        %places bomb if there is not already a bomb and it is not one of
        %the tiles attatched to the first click
        if (board(randomRow, randomColumn) ~= bombTile) && isBombable
            board(randomRow, randomColumn) = bombTile;
            bombsPlaced = bombsPlaced + 1;
        end
    end
end



end

