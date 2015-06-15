%Lab03.m
clear;clc;format long;
syms theta r phi;
countAll = 1000000;
countInIceCream = 0;
S = 0;
f = @(x,y,z) z*exp(-(x^2+y^2+z^2));

%draw the figure
figure('name','ice-cream figure');
z1 = @(x,y) sqrt(x.^2+y.^2);
g1 = ezmesh(z1,[-1/sqrt(2),1/sqrt(2),-1/sqrt(2),1/sqrt(2)],'circ');
hold on;
z2 = @(x,y) sqrt(1-x.^2-y.^2)+1;
g2 = ezmesh(z2,[-1/sqrt(2),1/sqrt(2),-1/sqrt(2),1/sqrt(2)],'circ');
title('ice-cream');
axis equal;

%generate random points
for i = 1:countAll
   w = [2*rand(1)-1,2*rand(1)-1,2*rand(1)];
   if (w(3)^2>w(1)^2+w(2)^2 && w(1)^2+w(2)^2+(w(3)-1)^2<1)
       countInIceCream = countInIceCream + 1;
       S = S + f(w(1),w(2),w(3));
   end
end

%calculate volume
V1 = eval(int(int(int(r*r*sin(theta),r,0,2*cos(theta)),...
    theta,0,pi/4),phi,0,2*pi));
V2 = 8 * countInIceCream / countAll;
fprintf('The actual volume of the ice-cream is %.6f.\n\n',V1);
fprintf('The estimated volume of the ice-cream is %.6f.\n\n',V2);


%calculate mass
M1 = eval(int(int(int(r^3*sin(theta)*cos(theta)*exp(-r^2),...
    r,0,2*cos(theta)),theta,0,pi/4),phi,0,2*pi));
M2 = S / countInIceCream * V2;
fprintf('The actual mass of the ice-cream is %.6f.\n\n',M1);
fprintf('The estimated mass of the ice-cream is %.6f.\n\n',M2);