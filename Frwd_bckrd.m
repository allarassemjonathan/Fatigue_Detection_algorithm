function  gamma = Frwd_bckrd(data, mu1, sigma1, mu2, sigma2, Markov_chain)
gamma = [];

f = [0.5 ;0.5];
MU1 = mu1; MU2 = mu2;
STD1 = sigma1; STD2 =  sigma2;

B1 = normpdf(data, MU1, STD1);
B2 = normpdf(data, MU2, STD2);
B = [B1; B2];
T = Markov_chain;
PI = []; 
O = [];

%forward walk
for i=1:size(B,2)
    O = B(:,i).*eye(size(B,1));
    f = O*T*f;
    s = f(1) + f(2);
    f = [f(1)/s; f(2)/s]; 
    PI =[PI f];
end

%backward walk
b = [1;1];
BE = [];
for i=size(B,2):-1:1
    O = B(:,i).*eye(size(B,1));
    b = T*O*b;
    s = b(1) + b(2);
    b = [b(1)/s; b(2)/s];
    BE = [b BE];
end

%Smoothing
gamma = PI.*BE;
end