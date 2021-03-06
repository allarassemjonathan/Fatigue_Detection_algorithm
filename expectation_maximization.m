function thetha = expectation_maximization(A)
mu1 = rand()*100;
mu2 = rand()*100;
var1 = std(A)-1;
var2 = std(A)+1;

sgamlike1 = rand(1,size(A,2));
sgamlike2 = 1 - sgamlike1;
disp(sgamlike1)
disp(sgamlike2)

likelihood = sum(log(normpdf(A, mu1, var1).*sgamlike1)) + sum(log(normpdf(A, mu2, var2).*sgamlike2));
arr = [likelihood];
evmu1 = [mu1];
evmu2 = [mu2];
evvar1 = [var1];
evvar2 = [var2];

for i=1:1000
    gamlike1 = sgamlike1;
    gamlike2 = sgamlike2;
    
    newmu1 = sum(gamlike1.*A)/sum(gamlike1);
    newmu2 = sum(gamlike2.*A)/sum(gamlike2);

    newvar1 = sqrt(sum(gamlike1.*(A-mu1).*(A-mu1))/sum(gamlike1));
    newvar2 = sqrt(sum(gamlike2.*(A-mu2).*(A-mu2))/sum(gamlike2));

    mu1 = newmu1;
    evmu1 = [evmu1, mu1];
    mu2 = newmu2;
    evmu2 = [evmu2, mu2];
    var1 = newvar1;
    evvar1 = [evvar1, var1];
    var2 = newvar2;
    evvar2 = [evvar2, var2];
    
    sgamlike1 = gamlike1.*normpdf(A, mu1, var1)./(gamlike1.*normpdf(A, mu1, var1) + gamlike2.*normpdf(A, mu2, var2));
    sgamlike2 = gamlike2.*normpdf(A, mu2, var2)./(gamlike1.*normpdf(A, mu1, var1) + gamlike2.*normpdf(A, mu2, var2));
    
    likelihood = sum(log(normpdf(A, mu1, var1).*sgamlike1)) + sum(log(normpdf(A, mu2, var2).*sgamlike2));
    arr = [arr, likelihood];
    disp(sgamlike1)
    disp(sgamlike2)
    if ~isnan(mu1) && ~isnan(mu2) && ~isnan(var1) && ~isnan(var2)
        thetha = [mu1, mu2, var1, var2];
    end
end
plot(arr);
end