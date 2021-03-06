% Dohun Kim, 2021-10-10

close all;
clear;
clc;

% load training/test dataset
load('X_train.mat')
load('X_test.mat')

%% PS2-1 Linear Classification
% (a) m and dimension of x(i) ?
X_train = cat(1, X_legi, X_spam);
y_train = cat(1, y_legi, y_spam);

[m, dim] = size(X_train);
fprintf('m = %d, dimension of x(i) = %d\n', m, dim);

% (b) visualize data points
figure(1);
plot(X_legi(:, 1), X_legi(:, 2), 'b.'); hold on;
plot(X_spam(:, 1), X_spam(:, 2), 'r.');

xlabel('x1'); ylabel('x2');
title('train dataset');
legend('X\_legi', 'X\_spam');

% (c) solve linear classifier using CVX
ulsc = UnbiasedLeastSuaresClassifier;
ulsc = ulsc.optimize(X_train, y_train);

train_acc = ulsc.accuracy(X_train, y_train);
fprintf('train accuracy = %2.2f%%\n', train_acc * 100);

figure(2);
ulsc.plotResult(X_train, y_train);
title('Unbiased Least Suares Classifier');

%% PS2-3. Margin-based vs. Least-Squares
% (a) margin-based linear classifier
mblc = MarginBasedLinearClassifier;
mblc = mblc.optimize(X_train, y_train);

train_acc = mblc.accuracy(X_train, y_train);
fprintf('train accuracy = %2.2f%%\n', train_acc * 100);

figure(3);
mblc.plotResult(X_train, y_train);
title('Train error: Margin-based Linear Classifier');

% (b) least-squares classifier
lsc = LeastSquaresClassifier;
lsc = lsc.optimize(X_train, y_train);

train_acc = lsc.accuracy(X_train, y_train);
fprintf('train accuracy = %2.2f%%\n', train_acc * 100);

figure(4);
lsc.plotResult(X_train, y_train);
title('Train error: Least Squares Classifier');

% (c) compare test error
mblc_test_acc = mblc.accuracy(X_test, y_test);
lsc_test_acc = lsc.accuracy(X_test, y_test);
fprintf('test accuracy: mblc = %2.2f%%, ', mblc_test_acc * 100);
fprintf('lsc = %2.2f%%\n', lsc_test_acc * 100);

figure(5);
mblc.plotResult(X_test, y_test);
title('Test error: Margin-based Linear Classifier');

figure(6);
lsc.plotResult(X_test, y_test);
title('Test error: Least Squares Classifier');


%% PS2-4. Simplex algorithm
% (b) sanity check using CVX
w = [4; 3];
A = [2, 3; -3, 2; 0, 2; 2, 1];
b = [6; 3; 5; 4];

cvx_begin
    variable x(2, 1);
    maximize(w' * x);
    subject to
        A * x <= b;
        x >= 0;
cvx_end

fprintf('x1 = %1.1f, x2 = %1.1f\n', x(1), x(2));






