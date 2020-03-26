%predict different scenarios
load name_province.mat

%predict without shutdown but with control
load without_shutdown_with_control.mat %noshutcon
modelfun = @(d,th) f3(d(:,1),th,th(end),d);
nsample = 500;
results2.sstype = 1;
out1 = mcmcpred(results2,chain2,s2chain2,data.xdata,modelfun,nsample);
figure
mcmcpredplot(out1,out.data,data,C);

%%%%%%predict with shutdown but without control
load with_shutdown_without_control.mat 
modelfun = @(d,th) f3(d(:,1),th,th(end),d);
nsample = 500;
results2.sstype = 1;
out2 = mcmcpred(results2,chain2,s2chain2,data.xdata,modelfun,nsample);

%%%%%%% predict without shutdown and without control
load without_shutdown_without_control.mat 
modelfun = @(d,th) f3(d(:,1),th,th(end),d);
nsample = 500;
results2.sstype = 1;
out3 = mcmcpred(results2,chain2,s2chain2,data.xdata,modelfun,nsample);



