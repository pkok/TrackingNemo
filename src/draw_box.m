function draw_box(figno, x, y)
figure(figno);
line([x(1), x(1)], [y(1), y(2)]);
line([x(2), x(2)], [y(1), y(2)]);
line([x(1), x(2)], [y(1), y(1)]);
line([x(1), x(2)], [y(2), y(2)]);