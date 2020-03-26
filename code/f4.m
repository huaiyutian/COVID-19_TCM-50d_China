function ydot = f4(t,y,theta,xdata)
% ode system function for MCMC algae example


gamma1(1:31)=theta(8); %time period from onset to isolation
gamma=1./gamma1;
sigma=1/theta(2);%Incubation period 
beta1=theta(1).*gamma; % transmission rate
report=theta(3); %report rate
control1(1:31)=theta(5);% control intensity
control1([30,4,24,18,22,19,10,9,28,27,8,21,16])=theta(6);
control1([31,29,25,11,23])=theta(4);
control2nd(1:31)=theta(7);%second control


Pwuhan=10892900;%population of Wuhan
flow=xdata(ceil(t),[2:31,96]);%matrix,1 colomu-1 province
HRwuhan=xdata(ceil(t),32);%wuhan report daily cases
HRwuhan(1:5)=theta(9);% estimated initial infected cases in wuhan from 1/11-1/15
pop=xdata(ceil(1:31),33);%population of other province 
importI=HRwuhan(1)*flow(1,:)/report/Pwuhan;%imported cases
timelevel1=xdata(ceil(t),[35:64,97]);
time2nd=xdata(ceil(t),[66:95,98]);

beta(1:31)=beta1;
HE(1,1:31) = importI;
HI(1,1:31) = 0;
HS(1,1:31) = pop'-HE(1,:)-HI(1,:);
HR(1,1:31) = 0;
I(1,1:31)=0;
beta(1:31)=beta1; 

for i = 2:40

%control since level 1 response
beta(find(timelevel1(i,:)==1))=beta1(find(timelevel1(i,:)==1)).*control1(find(timelevel1(i,:)==1));

%%2nd control 
beta(find(time2nd(i,:)==1))=beta1(find(time2nd(i,:)==1)).*control1(find(time2nd(i,:)==1)).*control2nd(find(time2nd(i,:)==1));

%Imported Infected cases
importI=HRwuhan(i)*flow(i,:)/report/Pwuhan;%1*30


%SEIR model
HS(i,:)=HS(i-1,:)-beta.*HI(i-1,:).*HS(i-1,:)./pop';
HE(i,:)=HE(i-1,:)+beta.*HI(i-1,:).*HS(i-1,:)./pop'+importI-sigma*HE(i-1,:);  
HI(i,:)=HI(i-1,:)+sigma*HE(i-1,:)-gamma.*HI(i-1,:);    
HR(i,:)=HR(i-1,:)+gamma.*HI(i-1,:);

I(i,:)=gamma.*HI(i-1,:);

end

 
ydot=[I(:,:)];

