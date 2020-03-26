clear model data params options
load data_model.mat
load name_province.mat

%%
% The model sum of squares in file <algaess.html |algaess.m|> is
% given in the model structure.
model.ssfun = @f2;

%%
% All parameters are constrained to be positive. The initial
% concentrations are also unknown and are treated as extra parameters.
params1 = {

    
    {'Ro', 2.2, 1.2,3.2,2.2,1}  %basic reproduction number
    {'sigma', 4.5, 4.1,7,4.7,0.51}  %incubation period
    {'report', 0.002,0,1} % report rate
    {'controlh',0.97,0,1,0.8,0.1} %control intensity
    {'controlm',0.64, 0,1,0.6,0.1}
    {'controllow',0.33,0,1,0.3,0.1}
    {'control2nd',0.012,0,1,0.05,0.05}%2nd control
    {'gamma', 5.29, 1,15,5,3}%time period from onset to isolation
    {'Iw0', 2,1,11}%intial infected cases in wuhan 
    
     
  
    
    };

%%
% We assume having at least some prior information on the
% repeatability of the observation and assign rather non informational
% prior for the residual variances of the observed states. The default
% prior distribution is sigma2 ~ invchisq(S20,N0), the inverse chi
% squared distribution (see for example Gelman et al.). The 3
% components (_A_, _Z_, _P_) all have separate variances.

model.S20 = [4];
model.N0  = [1];

%%
% First generate an initial chain.
options.nsimu = 50000;
options.stats = 1;
[results, chain, s2chain]= mcmcrun(model,data,params1,options);


% % %%generate  chain after burn-in
options.nsimu = 200000;
options.stats = 1;
[results2, chain2, s2chain2] = mcmcrun(model,data,params1,options,results);

%%
% Chain plots should reveal that the chain has converged and we can
% % use the results for estimation and predictive inference.
figure
mcmcplot(chain2,[],results2); %,'pairs'
figure
mcmcplot(chain2,[],results2,'denspanel',2);


%%
% Function |chainstats| calculates mean ans std from the chain and
% estimates the Monte Carlo error of the estimates. Number |tau| is
% the integrated autocorrelation time and |geweke| is a simple test
% for a null hypothesis that the chain has converged.

results2.sstype = 1; % needed for mcmcpred and sqrt transformation

chainstats(chain2,results2)


%%
% In order to use the |mcmcpred| function we need
% function |modelfun| with input arguments given as
% |modelfun(xdata,theta)|. We construct this as an anonymous function.

modelfun = @(d,th) f3(d(:,1),th,th(end),d);


% We sample 1000 parameter realizations from |chain| and |s2chain|
% and calculate the predictive plots.
nsample = 1000;
results2.sstype = 1;
out = mcmcpred(results2,chain2,s2chain2,data.xdata,modelfun,nsample);%data.ydata-->data

figure
mcmcpredplot(out,out.data,data,C);

