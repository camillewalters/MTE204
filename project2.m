clear all
close all
clc
%Part A

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

%solving for the x values
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

%plotting the displacements and positions
figure(1)
plot(positions, displacements)
title('Displacement as a function of position');
xlabel('Original Position from Wall');
ylabel('Displacement');

%Total displacement
totalDisplacement=x(1)+x(2)+x(3)+x(4)+x(5)

%Part B

% PART A (find displacements at each node point)

% 3x3 matrix for the system of equations for the Stepped Bar question
K = [603.75e6*pi -138e6*pi 0;
    -138e6*pi 163.875e6*pi -25.875e6*pi;
     0 -25.875e6*pi 25.875e6*pi];

P = [0; 0; 1000];

phi = linsolve(K,P) %solve for individual nodal displacement


% PART B (plot displacement for all locations)
pos_from_wall = [0 0.1 0.25 0.45];

displacement = [0 phi(1) phi(2) phi(3)];

figure(2)
plot(pos_from_wall, displacement)
title('Displacement for all locations on the bar as a function of position');
xlabel('position from wall [m]');
ylabel('displacement [m]');

% PART C (calculate the total displacement at end of bar)
total_disp = (phi(1)+phi(2)+phi(3))*1000
    %outputs total displacement at the end of the bar in cm
