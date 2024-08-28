function isBombable = bombableCheck(rowClicked, ColumnClicked, locationBeingChecked)
%BOMBABLECHECK checks if a bomb can be placed
%   takes in the first click coordinates and the location being checked on
%   the board. If the location being checked is within adjacent tiles to
%   where the first click was, then the bomb can not be placed. If it is
%   without that 3x3 area, the tile can have a bomb placed on it

isBombable = true;

minRow = rowClicked - 1;
maxRow = rowClicked + 1;
minCol = ColumnClicked - 1;
maxCol = ColumnClicked + 1;

%check to make sure that a bomb is not placed at the first click or any of
%the 8 surround tiles
for i = minRow:maxRow
    for j = minCol:maxCol
        if isequal(locationBeingChecked, [i,j])
            isBombable = false;
        end
    end
end
            

end

