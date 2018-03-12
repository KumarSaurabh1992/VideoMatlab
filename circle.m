function K = circle(x,v,r,time,num)
 %% Author : Kumar Saurabh.
 %%    x = coordinates of position
 %     v = velocity vector
 %   num = number of circles
 %     r = radius of the circle

clf('reset');

axis([-12 20 -12 20]);
number_of_colors = 50;
colormap(hsv);
cm = hsv(number_of_colors);
values_min = -1.5; % range of the colorbar
values_max = 1.5;
hold off;

for i = 1:num
    d = r*2;
    px = x(i)-r;
    py = 0   -r;
    l = rectangle('Position',[px py d d],'Curvature',[1,1]);
    values = v(i);
    idx_in_colorbar = floor(1+ (values - values_min) / (values_max -values_min) * (number_of_colors-1));
    matrix_with_rgb = cm(idx_in_colorbar,:);
    l.FaceColor = matrix_with_rgb;
    
    ah=annotation('textbox');
    % ...and position it on the current axis
    set(ah,'parent',gca);
    set(ah,'position',[x(i)-r/2 -0.8 0.5 0.5]);
    ah.LineStyle = 'none';
    ah.FontWeight = 'bold';
    set(ah,'String',num2str(i));
    daspect([1,1,1]);
end

set(gca, 'CLim', [values_min, values_max]);
title(['Time step = ',num2str(time)]);
h = colorbar;
xlabel(h, 'Velocity','FontSize',12,'FontWeight','bold');
axis off;
K = getframe(gcf);
