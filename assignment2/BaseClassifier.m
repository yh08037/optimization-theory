classdef BaseClassifier
    methods (Abstract)
        obj = optimize(obj, x, y);
        pred = predict(obj, x);
        [x, y] = getBoundary(obj, a, b);
    end
    
    methods
        function acc = accuracy(obj, x, y)
            acc = sum(obj.predict(x) == y) / size(x, 1);
        end
            
        function plotResult(obj, x, y)
            [x_min, x_max] = obj.getMinMax(x(:, 1));
            [y_min, y_max] = obj.getMinMax(x(:, 2));
            
            pred = obj.predict(x);
            obj.plotBoundary(x_min, x_max, 'k-');
            obj.plotPoints(x(pred==y, :), 'k.');
            obj.plotPoints(x(pred~=y, :), 'r.');
    
            ylim([y_min, y_max]);
            xlabel('x1'); ylabel('x2');
            legend('boundary', 'correct', 'error');
        end
        
        function [x_min, x_max] = getMinMax(~, x)
            x_min = min(x);
            x_max = max(x);
        end
        
        function plotPoints(~, x, color)
            plot(x(:,1), x(:,2), color);
            hold on;
        end
        
        function plotBoundary(obj, a, b, color)
            [x, y] = obj.getBoundary(a, b);
            plot(x, y, color); 
            hold on;
        end
    end
end
