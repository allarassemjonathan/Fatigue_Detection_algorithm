bounds = 10;
c = 3;
precision_m = [];
precision_v = [];
for delta=1:bounds
    A = gen(c,c, bounds, delta, 10,10);
    theta = expectation_maximization(A);
    mup = sqrt(theta(1)^2 + theta(2)^2);
    sp = sqrt(theta(3)^2 + theta(4)^2);
    s = sqrt(bounds^2 + delta^2);
    precision_v = [precision_v, 1/abs(sp-s)];
end
plot(precision_v)

