function [wantPlay] = winnerScreen(boardBackground,boardForeground, difficulty)
%WINNERSCREEN displays the winner screen
%   displays the winner screen and asks the player if they want to play
%   again or quit. Returns the players choice based on the click.

Game_Scene = simpleGameEngine('MineSweeper.png', 84, 84, 1, [245,245,245]);


%gets number of rows and columns
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
        %reveal the whole board for background
        
        if boardForeground(i,j) == tFlag && boardBackground(i,j) ~= tBomb 
            boardBackground(i,j) = tRedX;

        elseif boardForeground(i,j) == tCovered && boardBackground(i,j) ~= tBomb 
            boardBackground(i,j) = tCovered;

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
    text(84*4.5,84*1.5,"YOU WIN!","FontSize", 55, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

%intermediate foreground
elseif difficulty == 2
    boardForeground(9:11, 4:13) = playAgainButton;
    boardForeground(13:15, 4:13) = quitButton;
    drawScene(Game_Scene, boardBackground, boardForeground);
    text(84*8,84*9.5,"PLAY AGAIN","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*8,84*13.5,"QUIT","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*8,84*3.5,"YOU WIN!","FontSize", 105, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

%advanced foreground
elseif difficulty == 3
    boardForeground(9:11, 10:21) = playAgainButton;
    boardForeground(13:15, 10:21) = quitButton;
    drawScene(Game_Scene, boardBackground, boardForeground);
    text(84*15,84*9.5,"PLAY AGAIN","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*15,84*13.5,"QUIT","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
    text(84*15,84*3.5,"YOU WIN!","FontSize", 105, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'r');

end



%loop to get a valid click
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

