clear all
clc

%stiffness matrix
k=[0.25 -0.25 0 0 0 0;
   -0.25 0.75 -0.5 0 0 0;
   0 -0.5 2 -1.5 0 0;
   0 0 -1.5 2.25 -0.75 0;
   0 0 0 -0.75 1.75 -1;
   0 0 0 0 -1 -1];

%stiffness matrix with boundary condition x1=0 (take out first row and
%column?)
kBoundary=[0.75 -0.5 0 0 0;
               -0.5 2 -1.5 0 0;
               0 -1.5 2.25 -0.75 0;
               0 0 -0.75 1.75 -1;
               0 0 0 -1 -1];
%force vector
F=[0;0;0;0;2]

x=kBoundary\F

A=[2 -1 0 0;
    -1 2 -1 0;
    0 -1 2 -1;
    0 0 -1 1];
b=[0;0;0;1];
y=A\b

