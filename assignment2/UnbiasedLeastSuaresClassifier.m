classdef UnbiasedLeastSuaresClassifier < BaseClassifier
    properties
        w
    end
    
    methods       
        function obj = optimize(obj, x, y)
            cvx_begin
                variable w(size(x, 2))
                minimize(norm(x * w - y))
            cvx_end
            obj.w = w;
        end
        
        function pred = predict(obj, x)
            pred = sign(x * obj.w);
        end
        
        function [x, y] = getBoundary(obj, a, b)
            x = linspace(a, b);
            y = - obj.w(1) ./ obj.w(2) .* x;
        end
    end
end
