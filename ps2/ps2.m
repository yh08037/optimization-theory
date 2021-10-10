% Dohun Kim, 2021-10-10

%% PS2-1 Linear Classification
% (a) m := dimension of x(i) ?
n_col = size(X_legi, 1);
fprintf('m = %d\n', n_col);

% (b) visualize data points
figure(1);
plot(X_legi(:, 1), X_legi(:, 2), 'b.');
hold on;
plot(X_spam(:, 1), X_spam(:, 2), 'r.');

axis([-0.8 0.8 -0.8 0.8]);
axis square

xlabel('x')
ylabel('y')
legend('X\_legi', 'X\_spam')

% (c) solve linear classifier using CVX


%% PS2-3. Margin-based vs. Least-Squares
% (a) margin-based linear classifier


% (b) least-squares classifier


%% PS2-4. Simplex algorithm
% (b) sanity check using CVX






