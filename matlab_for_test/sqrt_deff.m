
%  作者: 点点 
%  功能：确定定点位数下取模的精确度（误差）
%  引文：《COMPUTER ARITHMETIC : Algorithms and Hardware Designs》
%        chapter： WORST-CASE ERROR ACCUMULATION

clc
clear 
close all
warning off
currentFolder = pwd;
addpath(genpath(currentFolder));

erroo =[];
defff= [];
for n = 1:27
    b = 26;
    rerro = round_erro(b,1,n);
    aerro = app_erro(sqrt(0.5),n);
    erro = aerro+rerro;
    deff = -log2(erro);
    erroo = [erroo erro];
    defff = [defff deff];
%     fprintf('Kun-iter:%.4f \n',deff);
end
defff = defff';
erroo = erroo';

k_mul=1/cal_kun(1,14,0);
%% round erro
function aerro = app_erro(v0,n)
v0 =abs(v0);
aerro = v0-v0*cos(atan(2^(1-n)));
end

   
%% round erro
function kun_i=cal_kun(u,n,start)
kun_i = 1;
for i=start:n-1
    kun_i = kun_i*sqrt(1+u*2^(-2*i));
%     fprintf('Kun--iter:%d  k: %.10f \n',i,kun_i);
end
end

function gun_i = cal_gun(u,n)
gun_i=1;
for i=1:n-1
    gun_i= gun_i+cal_kun(u,n,i);
%     fprintf('Gun--iter:%d  k: %.10f \n',i,gun_i);
end
end

function rerro = round_erro(b,u,n)
a = 2^(-b-0.5);
b = (cal_gun(u,n)/cal_kun(u,n,0))+1;
rerro = a*b;
end