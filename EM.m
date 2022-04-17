
%Randomly pick the values for the distributions and Markov chain's value
MU1 = 10;
STD1 = 1;
MU2 = 10;
STD2 = .1;
T = [0.9 .1; .1 .9];

for iter=1:100
    
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
MU1 = mean(distr1);
STD1 = std(distr1);

distr2 = gamma(2,:).*data;
MU2 = mean(distr2);
STD2 = std(distr2);

disp('round');disp(iter);
disp(MU1);
disp(STD1);

disp(MU2);
disp(STD2);

end
