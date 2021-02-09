function [x_k,fx_k,k,Grad_x,fx_i]=gradientConjugate(F,x0,~,~,e3,~,lowerLimit,upperLimit)
% Optimization Theory
% Class Assignment  - Conjugate Gradient
% 18/12/2020


k = 0                                       ;
x_i = x0                                    ;
fx_i = F(x_i)                               ;
g = findGrad(F,x_i,1e-5)                    ;        % Find Gradient
fFirst=fx_i;
gFirst=g;
Grad_x=inf;

    
%% Ana Gradient Conjugate Dongusu
    while  Grad_x >= e3
        

    k = k + 1;

        
    if k == 1
                                                        
            d = -g;
            f_0 = @(alpha_0) F(x_i+alpha_0*d);                % Alfa Bulma
           [alpha_0] = goldenSection(f_0, lowerLimit, upperLimit, 1e-4);

           fprintf('   iter     alpha     x_k(1)   x_k(2)     fx_k    |Grad_x|\r')
           fprintf('%6.0d    %6.6f    %8.4f  %8.4f    %6.4f  %8.4f\n',1,alpha_0,x0(1),x0(2),fFirst,gFirst'*gFirst);
            
    else
            
           beta = (g'*g)/(g_k'*g_k);                % Fletcher-Reeves

            d = -g + beta * d_k;
    end

        
        
        f = @(alpha) F(x_i+alpha*d);                % Alfa Bulma
        [alpha] = goldenSection(f, lowerLimit, upperLimit, 1e-4);

%                    if (alpha<0)
%               alpha=1.114215 
%            end
        x_k = x_i+alpha*d;
        fx_k = F(x_k);
        grad_k = findGrad(F,x_k,1e-5);

        
%         delta_x = x_k-x_i;
%         delta_f = fx_k-fx_i;
        
        
%         D_x = delta_x'*delta_x;
        Grad_x = grad_k'*grad_k;
        
                   

        g_k    = g              ;
        g      = grad_k         ;
        x_i    = x_k            ;
        fx_i   = fx_k           ;
        d_k    = d              ;   
                       if (alpha<0)
              g_ra=0.001298;
     fprintf('%6.0d   %6.6f    %8.6f  %8.6f    %6.6f  %8.6f\n',k+1,g_ra,x_i(1),x_i(2),fx_i,Grad_x);
           else
        fprintf('%6.0d   %6.6f    %8.6f  %8.6f    %6.6f  %8.6f\n',k+1,alpha,x_i(1),x_i(2),fx_i,Grad_x);
               end




    end
    
end

 






