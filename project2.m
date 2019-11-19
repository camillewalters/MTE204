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
