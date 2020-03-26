function ss = f2(theta,data)
% algae sum-of-squares function

time   = data.ydata(:,1);
ydata  = data.ydata(:,2:32);
xdata  = data.xdata;

% 3 last parameters are the initial states
y0 = theta(end);

ymodel = f3(time,theta,y0,xdata);

ss =sum((sqrt(ymodel) - sqrt(ydata)).^2);
