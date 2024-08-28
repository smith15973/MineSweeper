function won = winnerCheck(background, foreground)
%WINNERCHECK checks if the player won
%   Checks if the player has won by iterating through board and checking to
%   see if all tiles that are not a bomb are revealed. If all of them are
%   then the player won and it is returned

%tile values
transparent = 1;
tBomb = 14;

%gets number of rows and columns
[row, col] = size(background);
won = true;

%if the background tile is not a bomb, and it is not uncovered, then the
%player hasn't won yet
for i = 1:row
    for j = 1:col
        if background(i,j) ~= tBomb && foreground(i,j) ~= transparent
            won = false;
        end
    end
end

end

