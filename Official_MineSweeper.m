 Game_Scene = simpleGameEngine('MineSweeper.png', 84, 84, 1, [245,245,245]);

transparent = 1;
tCovered = 2;
tFlag = 3;
t0 = 4;
t1 = 5;
t2 = 6;
t3 = 7;
t4 = 8;
t5 = 9;
t6 = 10;
t7 = 11;
t8 = 12;
tRedX = 13;
tBomb = 14;
playAgainTile = 15;
quitTile = 17;
bombTransparent = 18:19;
flagTransparent = 20;




userWantPlay = true;
while userWantPlay
    
    winCheck = false;
    loseCheck = false;

    [difficulty, numberOfBombs] = getDifficultyLevel();
    flagCounter = numberOfBombs;

    %this is the start of the game
    [boardBackground, boardForeground, numRows, numCol] = newGame(difficulty);
    close all hidden
    drawScene(Game_Scene, boardBackground, boardForeground);
    flagCounterText = text(1,1,int2str(flagCounter),"FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

        
    %until they have left clicked to reveal the tiles
    firstClick = false;
    while ~firstClick
        [rowClicked, colClicked, buttonClicked] = getMouseInput(Game_Scene);
        
        
        %if they left click to reveal tiles
        if (boardForeground(rowClicked,colClicked) == tCovered && buttonClicked == 1)
            firstClick = true;
            
            %place all the bombs
            boardBackground = placeBombs(boardBackground, difficulty, rowClicked, colClicked, numberOfBombs);
            
            %place all the tile numbers based on where the bombs are
            boardBackground = placeNumbers(boardBackground);
            
            %reveal tiles
            boardForeground = revealTiles(boardBackground, boardForeground, rowClicked, colClicked);
        
        %if they right click to place a flag
        elseif (boardForeground(rowClicked,colClicked) == tCovered && buttonClicked == 3)
            [boardForeground,flagCounter] = flagToggle(boardForeground, rowClicked, colClicked,flagCounter);
        end
        drawScene(Game_Scene, boardBackground, boardForeground);
        delete(flagCounterText);
        flagCounterText = text(-100,-100,int2str(flagCounter),"FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

    end

    %this part is run continously until they win or lose
    while ~loseCheck && ~winCheck
        
        validClick =false;
        while ~validClick
            [rowClicked, colClicked, buttonClicked] = getMouseInput(Game_Scene);
        
            %if they left click to reveal a covered tile
            if (boardForeground(rowClicked,colClicked) == tCovered && buttonClicked == 1)
                validClick = true;

                boardForeground = revealTiles(boardBackground, boardForeground, rowClicked, colClicked);
                
                %if the user clicks on a bomb
                if boardBackground(rowClicked,colClicked) == tBomb
                    loseCheck = true;
                    
                
                
                %else right now as long as we have no other buttons on the
                %screen, but basically if they press a number tile
                else
                    boardForeground(rowClicked,colClicked) = transparent;

                    winCheck = winnerCheck(boardBackground, boardForeground);
                    %reveal win screen with options
                
                 end

            %if they right click on a tile
            elseif ((boardForeground(rowClicked,colClicked) == tFlag || boardForeground(rowClicked,colClicked) == tCovered) && buttonClicked == 3)
                validClick = true;
                [boardForeground,flagCounter] = flagToggle(boardForeground, rowClicked,colClicked, flagCounter);
            end
        drawScene(Game_Scene, boardBackground, boardForeground);
        delete(flagCounterText);
        flagCounterText = text(1,1,int2str(flagCounter),"FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');
        end

    end
    
    if winCheck
        userWantPlay = winnerScreen(boardBackground, boardForeground, difficulty);
    else
        %ask user to play again screen
        userWantPlay = gameOverScreen(boardBackground, boardForeground, difficulty);
    end
    


            

end

close all hidden
clear
clc
