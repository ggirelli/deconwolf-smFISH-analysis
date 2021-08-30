function align_dots_ut()
close all

N = 100; % Number of points that are the same
M = 2000; % Number of extra random points
r = 4; % displacement, typically unknown
[A, B, delta0] = generate_test_data(N, M, r);

figure
scatter(A(:,1), A(:,2), 'ro')
hold on
scatter(B(:,1), B(:,2), 'gx')
title('Input data')
legend({'Channel A', 'Channel B'})
axis image

[delta, deltas] = align_dots(A, B, 2*r);

figure
scatter(deltas(:,1), deltas(:,2));

hold on
plot(delta(1), delta(2), 'rx', 'MarkerSize', 20);
plot(delta0(1), delta0(2), 'go', 'MarkerSize', 20);
grid on
axis image
axis(2*r*[-1, 1, -1, 1])
legend({'Displacements', 'Estimated shift', 'True shift'})

end

function [A, B, delta] = generate_test_data(N, M, r)

A = 2028*rand(N, 2);
B = A;

delta = randn(1,2);
delta = r*delta / norm(delta);

for kk = 1:2
    B(:,kk) = B(:,kk) + delta(kk);
end

B = B + .5*randn(size(B,1), size(B,2));
A = cat(1, A, 2024*rand(M,2));
B = cat(1, B, 2024*rand(M,2));

end
