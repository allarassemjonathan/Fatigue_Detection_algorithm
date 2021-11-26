X = stepOut
K = 2;
randidx = randperm(size(X,1));
centroids = X(randidx(1:K), :); 

 indices = zeros(size(X,1), 1);
 numRows = size(X,1);
for iter=1:5
   for i=1:numRows
    k = 1;
    min_dist = 0;
    for e=1:size(X,1)
        min_dist = (X(i,:) - centroids(1,:)).^ 2;
    end
    for j=2:K
        dist = 0;
        for e=1:size(X,1)
            dist =(X(i,:) - centroids(j,:)).^ 2;
        end
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    indices(i) = k;
  end
  disp (indices);
  count = 0;
  centroids = zeros(K,size(X,2));
 for ic=1:K
     sum = zeros(1,size(X,2));
     for r=1:size(X,1)
         if indices(r) == ic
             sum = sum + X(r,:);
             count = count + 1;
         end
     end
     div = ones(1,size(X,2))*count;
     centroids(ic, :) = sum ./div;
 end
end
disp(indices)
disp(centroids)