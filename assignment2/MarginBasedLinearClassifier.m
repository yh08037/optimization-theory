classdef MarginBasedLinearClassifier < BaseClassifier
    properties
        a, b, v
    end
    
    methods       
        function obj = optimize(obj, x, y)
            cvx_begin
                variables a(2) b v(size(x, 1))
                minimize(sum(v))
                subject to
                    y .* (x * a - b) + v >= 1;
                    v >= 0;
            cvx_end
            obj.a = a;
            obj.b = b;
            obj.v = v;
        end
        
        function pred = predict(obj, x)
            pred = sign(x * obj.a - obj.b);
        end
        
        function [x, y] = getBoundary(obj, a, b)
            x = linspace(a, b);
            y = (obj.b - obj.a(1) .* x) ./ obj.a(2);
        end
    end
end

