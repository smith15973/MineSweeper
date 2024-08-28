function [difficulty, numBombs] = getDifficultyLevel()
%getDifficultyLevel Menu to pick difficulty of game board
%   Returns 1 for easy, 2 for medium, 3 for hard
Title_Scene = simpleGameEngine('MineSweeper.png', 84, 84, 1, [245,245,245]);

bombTransparent = 18:19;
titleBackground = 1*ones(8,8);
titleBackground(3, 4:5) = bombTransparent;

drawScene(Title_Scene,titleBackground)

%the title
titleText = text(84*4,84,"MINE SWEEPER","FontSize", 35, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');

%makes the 3 boxes
beginnerBox = rectangle('Position',8.*[21,39,42,10], "curvature", 1,'FaceColor','r','EdgeColor','k','LineWidth',1);
intermediateBox = rectangle('Position',8.*[21,54,42,10], "curvature", 1,'FaceColor','r','EdgeColor','k','LineWidth',1);
advancedBox = rectangle('Position',8.*[21,69,42,10], "curvature", 1,'FaceColor','r','EdgeColor','k','LineWidth',1);

%the 3 text boxes
beginnerText = text(84*4,84*4.18,"BEGINNER","FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
intermediateText = text(84*4,84*5.63,"INTERMEDIATE","FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');
advancedText = text(84*4,84*7.03,"ADVANCED","FontSize", 20, "FontWeight","bold","HorizontalAlignment","center", "VerticalAlignment","middle", "Color", 'k');


%loop that gets a valid click
validClick = false;
while ~validClick
    [clickRow,clickCol,clickButton] = ginput(1);
    if clickButton == 1
        if (clickRow >= 8*21 && clickRow <= 8*63 && clickCol >= 8*39 && clickCol <= 8*49)%click beginner
            validClick = true;
            difficulty = 1;
            numBombs = 10;
        elseif (clickRow >= 8*21 && clickRow <= 8*63 && clickCol >= 8*54 && clickCol <= 8*64)%click intermediate
            validClick = true;
            difficulty = 2;
            numBombs = 40;
        elseif (clickRow >= 8*21 && clickRow <= 8*63 && clickCol >= 8*69 && clickCol <= 8*79)%click advanced
            validClick = true;
            difficulty = 3;
            numBombs = 99;
        else
            continue
        end
    end
end


close all hidden
end