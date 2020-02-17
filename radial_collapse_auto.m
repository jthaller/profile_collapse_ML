function [center,rz] = radial_collapse_auto(r)
%UNTITLED Summary of this function goes here
%   Step 1. create a loss function that measures the distances between
%   points (rz are the initial positions). This is the hard part. The data
%           was a mess to start with and I forget how its configured
%   Step 2. Appy gradient decent.
%   Step 3. Return the position vector of the final points, r_zeroed

% this is is how to manually select center. Will automate if I have time
figure(86038); hold off
scatter3(r(:,1),r(:,2),r(:,3),30,r(:,3))
set(gca,'LineWidth',1,'FontSize',20,'FontWeight','bold'); box on; grid on
axis equal
view(0,90)
% orig line below
% center = input('starting approx center: ');
% better line
center = ginput(1)


% rz = abs(x pos - center) + abs(y pos - center), z position
rz = [sqrt((r(:,1)-center(1)).^2 + (r(:,2)-center(2)).^2) r(:,3)];
plot(rz(:,1),rz(:,2),'.');  xlim([0 80])
    
% The loss function is tricky, because its not the distance between the
% line you've fit (your guess) and the points. Its the actual distance
% between the points nearest neighbor. It's not a self consistency problem
% either or a circle fit

%getloss functino ---------------------
% I will order them based on the z axis, then take the distance to their neighbors
% sum as the loss metric

% loss = 0;
% sortedmat = sortrows(rz, 2); 
% for i = 1:size(rz)-1
%     loss = loss + abs( sortedmat(i,1) - sortedmat(i+1,1));
%     if sortedmat(i,1) > 40 %this line proves key. might be necessary to have user specify cutoff
%         break;
%     end
% end

min_loss = 10^6 %just initializing some big value
%loop through rz x + dx for like dx = -2 to 2
    %loop thorugh rz y + dy for like dy = -2 to 2
        %report minimum dx to get true center
%currently the loop does what it's supposed to, but loss function isn't
%quite right
r_sorted = sortrows(r,3);
for dx = -2: 0.1: 2
    for dy = -2: 0.1: 2
        rz_sorted = [sqrt((r_sorted(:,1)-center(1)-dx).^2 + (r_sorted(:,2)-center(2)-dy).^2) r_sorted(:,3)];
        if get_loss(rz_sorted) < min_loss
           min_loss = get_loss(rz_sorted);
           best_dx = dx;
           best_dy = dy;
           
        end
    end
end

center(1) = center(1)-best_dx;
center(2) = center(2)-best_dy;

rz = [sqrt((r(:,1)-center(1)).^2 + (r(:,2)-center(2)).^2) r(:,3)];
    plot(rz(:,1),rz(:,2),'.');  xlim([0 80])
    title(center)
    
center
min_loss

end 
        





