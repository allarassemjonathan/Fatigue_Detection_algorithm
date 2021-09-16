data = round(rand(10,2)*10);

% choose inital cluster centers
c1 = data(1,:);
disp(c1)
c2 = data(2,:);
disp(c2)

si = size(data);
iter = si(1,1);
xsum1 = 0;
ysum1 = 0;
xsum2 = 0;
ysum2 = 0;
co1 = 0;
co2 = 0;
% here you can add something of the kind while(deltax 1= 0 and deltay != 0)
% keep looping
for i =1:iter
    %calculating the distance between centroids and data points
    pos1 = data(i,:) - c1;
    x1 = pos1(1,1);
    y1 = pos1(1,2);
    d1 = sqrt(x1^2 + y1^2);
    pos2 = data(i,:) - c2;
    x2 = pos2(1,1);
    y2 = pos2(1,2);
    d2 = sqrt(x2^2+ y2^2);
    
    %comparing the distances between the 2 centroids
    if d1>d2
        %adding this data point in the sum 
        %of the elements of this cluster
         xsum1 = xsum1 + x1;
         ysum1 = ysum1 + y1;
         co2 = co2 + 1;
    else
        xsum2 = xsum2 + x2;
        ysum2 = ysum2 + y2;
        co1 = co1 + 1;
    end
end

%Defining new centroids
c1 = [xsum1/co1, ysum1/co1];
c2 = [xsum2/co2, ysum2/co2];

disp(c1)
disp(c2)

% 1) assign each row to a cluster (closest)
% ex sum(abs(data(3,:)-c2))
% 2) re calculate cluster centers c1 and c2 (average of all rows assigned
% to that cluster)

% start with one loop and print results (cluster ave and row associations)
% 2 loops ....