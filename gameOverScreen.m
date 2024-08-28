function wantPlay = gameOverScreen(boardBackground,boardForeground, difficulty)
%GAMEOVERSCREEN Shows game over screen
%   This displays the Game Over Screen that should appear if the player
%   reveals a bomb. This also returns whether or not the player wants to
%   play again

Game_Scene = simpleGameEngine('MineSweeper.png', 84, 84, 1, [245,245,245]);

%gets the number of rows and columns
[numRows,numCol] = size(boardBackground);

%tile values
transparent = 1;
tCovered = 2;
tFlag = 3;
tRedX = 13;
tBomb = 14;
playAgainButton = 15;
quitButton = 17;

for i = 1:numRows
    for j = 1:numCol
        %if it was a flag and not a bomb, make it an X
        
        if boardForeground(i,j) == tFlag && boardBackground(i,j) ~= tBomb 
            boardBackground(i,j) = tRedX;
        
        %if its covered and not a bomb leave it as covered
        elseif boardForeground(i,j) == tCovered && boardBackground(i,j) ~= tBomb 
            boardBackground(i,j) = tCovered;
        
        %if its a flag and a bomb, leave it as a bomb
        elseif boardForeground(i,j) == tFlag && boardBackground(i,j) == tBomb 
            boardBackground(i,j) = tFlag;
        end
    end
end
        
boardForeground = transparent*ones(numRows, numCol);


close all hidden
%beginner foreground
if difficulty == 1
    boardForeground(4:5, 3:7) = playAgainButton;
    boardForeground(7:8, 3:7) = quitButton;
    drawScene(Game_Scene, boardBackground, boardForeground);

    text(84*4.5,84*4,"PLAY AGAIN","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*4.5,84*7,"QUIT","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*4.5,84*1.5,"Game Over","FontSize", 55, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

%intermediate foreground
elseif difficulty == 2
    boardForeground(9:11, 4:13) = playAgainButton;
    boardForeground(13:15, 4:13) = quitButton;
    drawScene(Game_Scene, boardBackground, boardForeground);
    text(84*8,84*9.5,"PLAY AGAIN","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*8,84*13.5,"QUIT","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*8,84*3.5,"Game Over","FontSize", 105, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

%advanced foreground
elseif difficulty == 3
    boardForeground(9:11, 10:21) = playAgainButton;
    boardForeground(13:15, 10:21) = quitButton;
    drawScene(Game_Scene, boardBackground, boardForeground);
    text(84*15,84*9.5,"PLAY AGAIN","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*15,84*13.5,"QUIT","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*15,84*3.5,"Game Over","FontSize", 105, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

end



%loop that gets a value click
validClick = false;
while ~validClick
    [rowClick, colClick,~] = getMouseInput(Game_Scene);

    if boardForeground(rowClick,colClick) == playAgainButton
        validClick = true;
        wantPlay = true;
    elseif boardForeground(rowClick,colClick) == quitButton
        validClick = true;
        wantPlay = false;
    else
        continue
    end
end

close all hidden
end


