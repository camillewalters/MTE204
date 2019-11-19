clear all
clc

%Part A: displacement at each node
%stiffness matrix
k=[0.25 -0.25 0 0 0 0;
   -0.25 0.75 -0.5 0 0 0;
   0 -0.5 2 -1.5 0 0;
   0 0 -1.5 2.25 -0.75 0;
   0 0 0 -0.75 1.75 -1;
   0 0 0 0 -1 1];

%stiffness matrix with boundary condition x1=0
kBoundary=[0.75 -0.5 0 0 0;
           -0.5 2 -1.5 0 0;
               0 -1.5 2.25 -0.75 0;
               0 0 -0.75 1.75 -1;
               0 0 0 -1 1];

%force vector
F=[0;0;0;0;2];

x=kBoundary\F

%Part B: plot displacement as function of position
positions=[0 1 2 3 4 5];

%displacements
node1=0;
node2=x(1);
node3=x(2);
node4=x(3);
node5=x(4);
node6=x(5);

displacements=[node1 node2 node3 node4 node5 node6]

figure()
plot(positions, displacements)
title('Displacement as a function of position');
xlabel('Original Position from Wall');
ylabel('Displacement');

%Total displacement
totalDisplacement=x(1)+x(2)+x(3)+x(4)+x(5)


% 
% clear all
% close all
% clc
% 
% % PART A (find displacements at each node point)
% 
% %3x4 matrix
% K = [-1.863e9.*pi 0 0;
%     2.415e9.*pi -552e6.*pi 0;
%     -552e6.*pi 655.5e6.*pi -103.5e6.*pi;
%      0 -103.5e6.*pi 103.5e6.*pi];
% 
% P = [0; 0; 0; 1000];
% 
% phi = linsolve(K,P)
%     %for some reason this ends up in negative values which makes no sense
%     %whatsoever and so now im just confused
% 
% % PART B (plot displacement for all locations)
%     %i think x axis is position and y axis is just the displacement
% node1 = 0;
% node2 = (phi(1)+0.1);
% node3 = (node2+0.15+phi(2));
% node4 = (node3+0.2+phi(3));
% pos_from_wall = [node1 node2 node3 node4];
% 
% displacement = [0 phi(1) phi(2) phi(3)];
% 
% figure()
% plot(pos_from_wall, displacement)
% title('Displacement for all locations on the bar as a function of position');
% xlabel('position from wall [m]');
% ylabel('displacement [m]');
% 
% % PART C (calculate the total displacement at end of bar)
% total_disp = (phi(1)+phi(2)+phi(3))*1000
%     %outputs in cm
