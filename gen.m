function A = gen(mu1, mu2, sigma1, sigma2, size1, size2)
A1 = normrnd(mu1, sigma1, [1,size1]);
A2 = normrnd(mu2, sigma2, [1,size2]);
A=[A1,A2];
end
