function [grad] = findGrad(F,x,dx)
% Optimization Theory
% Class Assignment  - Find Gradient
% 18/12/2020
    n = length(x);
    grad = zeros(n,1);
    dx=abs(dx);

    for i=1:n
        x1=x; x2=x;
        x1(i)=x1(i)+dx;
        x2(i)=x2(i)-dx;
        grad(i)=(F(x1)-F(x2))/(2*dx);
    end

end