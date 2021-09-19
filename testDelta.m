%gathering the data
data = round(rand(10,2)*10);

%initializing the 2 centroids
c1 = data(1,:);
c2 = data(2,:);

%initializing the 2 clusters
cluster1 = [];
cluster2 = [];

%initailizing the number of time we want to iterate
numberIter = 1000;

for j =1:numberIter
    for i=1: size(data)
        
        %calcul of the distance between one data point
        %and the clusters
        d1 = sqrt(sum((data(i,:)-c1).^2));
        d2 = sqrt(sum((data(i,:)-c2).^2));
        
        
        if d1<d2
            cluster1 = [cluster1; data(i,:)];
        else
            cluster2 = [cluster2; data(i,:)];
        end
        c1 = mean(cluster1);
        c2 = mean(cluster2);
    end
    disp("iteration :" + j)
    disp(c1)
    disp(c2)
end

