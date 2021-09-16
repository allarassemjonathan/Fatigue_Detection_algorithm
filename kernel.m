data = round(rand(10,2)*10);

% choose inital cluster centers
c1 = data(1,:);
c2 = data(2,:);

si = size(data);

% loop
for i =1:si(1,1)
    pos1 = data(i,:) - c1;
    x1 = pos1(1,1);
    y1 = pos1(1,2);
    d1 = sqrt(x1^2 + y1^2);
    pos2 = data(i,:) - c2;
    x2 = pos2(1,1);
    y2 = pos2(1,2);
    d2 = sqrt(x2^2+ y2^2);
    if d1>d2
        disp("cluster 2")
    else
        disp("cluster 1")
    end
end
% 1) assign each row to a cluster (closest)
% ex sum(abs(data(3,:)-c2))
% 2) re calculate cluster centers c1 and c2 (average of all rows assigned
% to that cluster)

% start with one loop and print results (cluster ave and row associations)
% 2 loops ....