data = [normrnd(5,.1, [1 100]), normrnd(3,1) [1 100]];

%Randomly pick the values for the distributions and Markov chain's value
MU1 = mean(data) -1;
STD1 = std(data)+1;
MU2 = mean(data);
STD2 = std(data)-1;
T = [0.8 .2; .2 .8];

for iter=1:10000
    
%Do the forward backward algorithm
gamma = Frwd_bckrd(data,MU1,STD1,MU2,STD2,T);

%Maximizing and smoothing the gamma vector
gamma = round(gamma);
for i=1:size(gamma,2)
    if gamma(1,i)>gamma(2,i)
        gamma(1,i) =1;
        gamma(2,i) = 0;
    else
        gamma(1,i) = 0;
        gamma(2,i) = 1;
    end
end

%recompute mus and sigmas

distr1 = gamma(1,:).*data;
distr1 = distr1(distr1>0);
disp(distr1);
MU1 = mean(distr1);
STD1 = std(distr1);

distr2 = gamma(2,:).*data;
distr2 = distr2(distr2>0);
disp(distr2);
MU2 = mean(distr2);
STD2 = std(distr2);

end
