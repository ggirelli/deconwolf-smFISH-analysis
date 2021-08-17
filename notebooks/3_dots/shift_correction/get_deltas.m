function deltas = get_deltas(A, B, r)
IDX = rangesearch(B, A, r);
deltas = [];
for kk = 1:numel(IDX)
    match = IDX{kk};
    P = B(match,:);
    Q = P;
    for ll = 1:2
        Q(:,ll) = Q(:,ll) - A(kk, ll);
    end
    deltas = cat(1, deltas, Q);
end
end