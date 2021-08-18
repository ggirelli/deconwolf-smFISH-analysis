ndots=5000;
r=4;

for field_id=1:7

    data20=textscan(fopen(sprintf('/mnt/data/Imaging/202105-Deconwolf/data_210726/20x_raw_calc/%03d_allDots.csv', field_id)),...
        '%s %s %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f', 'Delimiter', ',', 'HeaderLines', 1);
    [~, value_ordered] = sort(data20{7}, 'descend');
    xy20=[data20{4}, data20{5}];
    xy20=xy20(value_ordered, :);
    xy20=xy20(1:ndots, :);

    data60=textscan(fopen(sprintf('/mnt/data/Imaging/202105-Deconwolf/data_210726/60x_dw_calc/%03d_allDots.csv', field_id)),...
        '%s %s %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f', 'Delimiter', ',', 'HeaderLines', 1);
    [~, value_ordered] = sort(data60{7}, 'descend');
    xy60=[data60{4}, data60{5}];
    xy60=xy60(value_ordered, :);
    xy60=xy60(1:ndots, :);

    [shift, deltas] = align_dots(xy20, xy60/3, 4);

    hold on
    plot(xy20(:,1), xy20(:, 2), 'b.')
    plot(xy60(:,1)/3, xy60(:, 2)/3, 'r.')
    fig=gcf();
    saveas(fig, sprintf("60x_dw.to_20x_raw.%03d.png", field_id));
    close('all');

    hold on
    plot(xy20(:,1), xy20(:, 2), 'b.')
    plot(xy60(:,1)/3-shift(1)*2, xy60(:, 2)/3-shift(2)*2, 'r.')
    fig=gcf();
    saveas(fig, sprintf("60x_dw.to_20x_raw.%03d.shifted.png", field_id));
    close('all');

    display([field_id, shift])
end