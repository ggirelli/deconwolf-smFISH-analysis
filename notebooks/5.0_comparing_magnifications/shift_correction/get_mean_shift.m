function v = get_mean_shift(V, rad)
% mean shift or something ...
% rad is the radius, i.e., points can be up to 2r apart

v = [0, 0];
r = rad;

for r = linspace(2*rad, 0.1, 200)
    % distance from each point to the centre
    %d = ((V(:,1)-v(1)).^2 + (V(:,2)-v(2)).^2).^(1/2);
    w = mvnpdf(V, v, eye(2)*r); % Weights
    v = sum(V.*w)/sum(w(:));
end
end