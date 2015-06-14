%Lab04.m
clear;clc;format long;
syms theta r phi;
countAll = 1000000;
countInIceCream = 0;
S = 0;
f = @(x,y,z) z*exp(-(x^2+y^2+z^2));

%画出冰淇淋图形
z1 = @(x,y) sqrt(x.^2+y.^2);
figure('name','冰激凌图形');
g1 = ezmesh(z1,[-1/sqrt(2),1/sqrt(2),-1/sqrt(2),1/sqrt(2)],'circ');
hold on;
z2 = @(x,y) sqrt(1-x.^2-y.^2)+1;
g2 = ezmesh(z2,[-1/sqrt(2),1/sqrt(2),-1/sqrt(2),1/sqrt(2)],'circ');
title('冰激凌');
axis equal;

%生成随机点
for i = 1:countAll
   w = [2*rand(1)-1,2*rand(1)-1,2*rand(1)];
   if (w(3)^2>w(1)^2+w(2)^2 && w(1)^2+w(2)^2+(w(3)-1)^2<1)
       countInIceCream = countInIceCream + 1;
       S = S + f(w(1),w(2),w(3));
   end
end

%求冰激凌体积
V1 = eval(int(int(int(r*r*sin(theta),r,0,2*cos(theta)),theta,0,pi/4),phi,0,2*pi));
V2 = 8 * countInIceCream / countAll;
fprintf('用确定性方法求得的冰淇淋体积为%.6f\n\n',V1);
fprintf('用蒙特卡罗方法求得的冰淇淋体积为%.6f\n\n',V2);


%求冰激凌质量
M1 = eval(int(int(int(r^3*sin(theta)*cos(theta)*exp(-r^2),r,0,2*cos(theta)),theta,0,pi/4),phi,0,2*pi));
M2 = S / countInIceCream * V2;
fprintf('用确定性方法求得的冰淇淋质量为%.6f\n\n',M1);
fprintf('用蒙特卡罗方法求得的冰淇淋质量为%.6f\n\n',M2);