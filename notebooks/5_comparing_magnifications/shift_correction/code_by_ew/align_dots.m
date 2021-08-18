function [delta, deltas] = align_dots(A, B, r)
% function align_dots(A, B, r)
% Find a shift vector that brings the set A and B on top of each others

% Find closest points in B for each point in A
deltas = get_deltas(A, B, r);

% Estimate the location of the peak of the deltas
delta = get_mean_shift(deltas, r);
end
