%S.C. Chapra and R.P. Canale, Numerical Methods for Engineers, 7th ed. New York, NY: McGraw Hill Education, 2015, p. 310.

%matrix (subsititute in appropriate values as determined in question)
A= [-17/105 1/30 0 1/10;
    1/30 -79/210 1/5 1/7;
    0 1/5 -23/90 1/18;
    1/10 1/7 1/18 -157/315];
%solution matrix
b= [-10/35; 0; 0; -40]'
%initial guess
x=[0 0 0 0]'
%determines number of variables (in this case, 4)
n=size(x,1);
%initialize error matrix to infinity
error=Inf([n,1]); 
%initialize error to reach before stopping
stoppingError=1;
iteration=0;
%weighting factor
lambda=1.4;


%dividing each equation by diagonal (represents division in equation)
for i=1:n
    z=A(i,i)
    for j=1:n
        A(i,j)=A(i,j)/z;
    end
    b(i)=b(i)/z;
end

while max(error)>stoppingError
%reassigning assigning last iteration to x_old
x_old=x;
for i =1:n
    old=x(i);
    sum = b(i);
    for j=1:n
         if i~=j
            %this step is equivalent to the isolation of the variable for
            %which we are solving
            sum = sum - (A(i,j)*x(j));
         end
    end
    x(i)=lambda*sum+(1.-lambda)*old;
end
        
        
        
    %updating error matrix
    if iteration == 0 
        %do nothing because initial error will be 0
        error=error;
    else
        for i=1:n
        error(i,1)=abs(((x(i,1)-x_old(i,1))/x(i,1))*100);
        end
    end 
    
    iteration=iteration+1;    
    fprintf('\nIteration %d: \n%f\n%f\n%f\n%f\n',iteration,x);
    fprintf('\nError at iteration %d: \n%f\n%f\n%f\n%f\n',iteration,error);
end
%%
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f in %d iterations',x,iteration);