XFatigued = randn(1,100)*0.5 + 1.3;
XNonFatigued = randn(1,100)*0.6 + 1.5;
XFatiguedclean = XFatigued(XFatigued>0);
XNonFatiguedclean = XNonFatigued(XNonFatigued>0);
X = [XFatiguedclean ,XNonFatiguedclean];
nbins = 25;

fig = figure;
s(1) = subplot(2,2,1);
s(2) = subplot(2,2,2);
s(3) = subplot(2,2,3);
s(4) = subplot(2,2,4);

histogram(s(1),X, nbins);
xlabel('frequency of the feature');
ylabel('feature');
title('Raw data histogram');

histogram(s(2),XNonFatiguedclean, nbins);
xlabel('frequency of the non-fatigued state');
ylabel('feature');
title('Fatigued data histogram');

histogram(s(3),XFatiguedclean, nbins);
xlabel('frequency of the fatigued state');
ylabel('feature');
title('Non-fatigued data histogram');


histogram(s(4),XFatiguedclean, nbins);
hold on
histogram(s(4),XNonFatiguedclean, nbins);