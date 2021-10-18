classdef LeastSquaresClassifier < BaseClassifier
    properties
        w
    end
    
    methods       
        function obj = optimize(obj, x, y)
            [rows, cols] = size(x);
            x_biased = cat(2, ones(rows, 1), x);
            cvx_begin
                variable w(cols + 1);
                minimize(norm(x_biased * w - y))
            cvx_end
            obj.w = w;
        end
        
        function pred = predict(obj, x)
            rows = size(x, 1);
            x_biased = cat(2, ones(rows, 1), x);
            pred = sign(x_biased * obj.w);
        end
        
        function [x, y] = getBoundary(obj, a, b)
            x = linspace(a, b);
            y = -(obj.w(1) + obj.w(2) .* x) ./ obj.w(3);
        end
    end
end

