data = round(rand(10,2)*10);

% choose inital cluster centers
c1 = data(1,:);
c2 = data(2,:);

si = size(data);

% loop
for i =1:si(1,1)
    d1 = data(i,:)-c1;
    d2 = data(i,:)-c2;
end
% 1) assign each row to a cluster (closest)
% ex sum(abs(data(3,:)-c2))
% 2) re calculate cluster centers c1 and c2 (average of all rows assigned
% to that cluster)

% start with one loop and print results (cluster ave and row associations)
% 2 loops ....