% MISOANN04
clear
close all
clc
%...Veriler aliniyor
% t= xlsread('C:\Users\omar1\OneDrive\Desktop\optimi\in.xlsx');
% y=xlsread('C:\Users\omar1\OneDrive\Desktop\optimi\out.xlsx');
%----------------
t= xlsread('C:\Users\omar1\OneDrive\Desktop\optimi\in2.xlsx');
y=xlsread('C:\Users\omar1\OneDrive\Desktop\optimi\out2.xlsx');
%----------------
%........................
S = 22;
N = size(t,1); % veri sayisi
R = size(t,2); % giris sayisi
% veriler karistiriliyor
%..veriler ikiye ayriliyor
II = randperm(N);
TrainingIndex = II(1:round(N/1.3));
ValidationIndex = II(round(N/1.3)+1:N);
% TrainingIndex = 1:2:N;
% ValidationIndex = 2:2:N;
tTra = t(TrainingIndex,:);
yTra = y(TrainingIndex,:);
tVal = t(ValidationIndex,:);
yVal = y(ValidationIndex,:);
%S = 100;
%------------------
% FVALBEST = []; S = [];
% for s = 21:21
%     top = 0;
%     for i=1:5
%         [xBEST,fValBEST] = MISOANN(tTra,yTra,tVal,yVal,s);
%         top = top + fValBEST;
%     end
%     fValBEST = top/5;
%     S = [S; s];
%     FVALBEST = [FVALBEST, fValBEST];
%     s
%     fValBEST
% end
% stem(S,FVALBEST)
% xlabel('S')
% ylabel('Fval^{*}')
%------------------
[xBEST,fValBEST] = MISOANN(tTra,yTra,tVal,yVal,S);
[yhatBEST] = MISOANNmodelGC(t,xBEST,S,R);
yhatBEST = sign(yhatBEST);

NumOfMisClass = length(find(y~=yhatBEST))
% subplot(211)
% IplusTra = find(yTra==+1); IminusTra = find(yTra==-1); 
% IplusVal = find(yVal==+1); IminusVal = find(yVal==-1); 
% plot(tTra(IplusTra,1),tTra(IplusTra,2),'bo'); hold on
% plot(tTra(IminusTra,1),tTra(IminusTra,2),'bx'); 
% plot(tVal(IplusVal,1),tVal(IplusVal,2),'ro'); 
% plot(tVal(IminusVal,1),tVal(IminusVal,2),'rx'); 
%  subplot(212)
% Iplus = find(yhatBEST==+1);
% Iminus = find(yhatBEST==-1);
% plot(t(Iplus,1),t(Iplus,2),'mo'); hold on
% plot(t(Iminus,1),t(Iminus,2),'mx'); 

TestImage=[0 5 0 1]; %% image for test  == [0 x 
%                                           0 x] ==1
yhatBEST2 = MISOANNmodelGC(TestImage,xBEST,S,R);
yhatBEST2 = sign(yhatBEST2);
if(yhatBEST2)==-1
    Sonuc=0;
else
    Sonuc=1;
end

Sonuc



% mint1 = floor(min(t(:,1))); maxt1 = ceil(max(t(:,1)));
% mint2 = floor(min(t(:,2))); maxt2 = ceil(max(t(:,2)));
% T1 = []; T2 = []; PrevOutput = 0;temp=0;
% for t1=mint1:0.01:maxt1
%     for t2=mint2:0.01:maxt2
%         input = [t1,t2];
%         [yhatBEST1] = MISOANNmodelGC(input,xBEST,S,R);
%         if PrevOutput*yhatBEST1<=0
%             
%             T1 = [T1; t1];
%             T2 = [T2; t2];
%         end
%         PrevOutput = yhatBEST1;
%         temp=t2;
%     end
% end
% for i=1:size(T2,1)
%     if T2(i)<=-1
%         T2(i)=temp;
%     end
%     temp=T2(i);
% end

