function [loss] = get_loss(sortedmat)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
loss_r = 0;
% loss in r direction (x-axis) from sorting b z value

for i = 1:size(sortedmat)-3
    loss_r = loss_r + ( sqrt( (sortedmat(i,1) - sortedmat(i+1,1) )^2 ) ...
        + abs(sortedmat(i,1) - sortedmat(i+2,1) ) ... 
        + abs(sortedmat(i,1) - sortedmat(i+3,1) )  /3 );
    if sortedmat(i,1) > 30 %this line proves key. might be necessary to have user specify cutoff
        break;
    end
end

loss = loss_r;

% sorted_r = sortrows(sortedmat,1);
% loss_z = 0;
% for i = 1:size(sortedmat)-1
%     loss_z = loss_z + abs( sorted_r(i,2) - sorted_r(i+1,2));
%     if sortedmat(i,1) > 20 %this line proves key. might be necessary to have user specify cutoff
%         break;
%     end
% end
% loss= loss_r + loss_z;

end

