% Optimization Theory
% Class Assignment  - Conjugate Gradient
% 18/12/2020


clc;
clear;
close all;
format compact


%% Rosenbrock Fonksiyonu

%F=@(x) 100*(x(2)-x(1).^2).^2 + (1-x(1)).^2             ;
F=@(x) x(1).^2+0.5*x(2).^2+3                            ;


%% Algoritma 

%x0 = [-2 2]'                                                                ;    % Initial Point
x0 = [1 2]'                                                                  ;    % Initial Point
e1 = 1e-8                                                                   ;     % lower bound on the size of a step
e2 = 1e-8                                                                   ;     % lower bound of the objective function
e3 = 1e-4                                                                   ;     % Gradient Tolerance
k_Max=500                                                                   ;     % Maximum Iteration
lowerLimit = -5                                                             ;     % Golden Section Lower Limit 
upperLimit =  5                                                             ;     % Golden Section Upper Limit

[x_k]=gradientConjugate(F,x0,e1,e2,e3,k_Max,lowerLimit,upperLimit);        % Conjugate Gradient

% fprintf('   iter   x_k(1)  x_k(2)     f(x_i)    |Grad_x|\r')
% fprintf('%6.0d %8.6f %10.8f %9.6f %8.3f\n',k,x_k(1),x_k(2),fx_i,Grad_x)


%% Plot

x = -2:0.05:2                                       ;
y = -1:0.05:1.5                                     ;
[X,Y] = meshgrid(x,y)                               ;
nX = length(x)                                      ;
nY = length(y)                                      ;
Z = zeros(nY,nX)                                    ;
for i = 1:nY
    for j = 1:nX
        Z(i,j) = F([X(i,j),Y(i,j)])                 ;
    end
end


figure
hold on
grid 
contour(X,Y,Z,[0:2:60])
plot(x0(1),x0(2),'go')
plot(1,1,'ro')
plot(x_k(1),x_k(2),'bx')
legend('Function','Guess value','Correct minimum','Calculated minimum');




