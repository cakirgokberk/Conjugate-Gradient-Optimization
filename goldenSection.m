function [x1,x2,fx1,fx2,N,tolerance] = goldenSection(func, xLowerLimit, xUpperLimit,xFinalPoint)
% Optimization Theory
% Class Assignment  - Golden Section Search
% 19/11/2020 

    
    tao = 0.38197;
    
    tolerance = xFinalPoint/(xUpperLimit - xLowerLimit);
    
    N = floor(-2.078*log(tolerance));
    
    x1 = xLowerLimit + tao*(xUpperLimit - xLowerLimit);
    fx1 = func(x1);
    x2 = xUpperLimit - tao*(xUpperLimit - xLowerLimit);
    fx2 = func(x2);
    
    k = 0;
    
    
    for i=1:N
    
     if k<N
        
        if fx1>fx2
            
            xLowerLimit = x1;
            
            x1 = x2;
            x  = x1;
            fx1 = fx2;
            
            x2 = xUpperLimit - tao*(xUpperLimit - xLowerLimit);
            fx2 = func(x2);
            
            k = k + 1;
            
            
        elseif fx1<fx2
            
            xUpperLimit = x2;
            
            x2 = x1;
            x  = x2;
            fx2 = fx1;
            
            x1 = xLowerLimit + tao*(xUpperLimit - xLowerLimit);
            fx1 = func(x1);
           
            k = k + 1;
          
            end
        
            else
        
            break;
        end  
    end   
end



















