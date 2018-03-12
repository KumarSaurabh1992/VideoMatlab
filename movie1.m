%% Author : Kumar Saurabh.
% This code creates the movie with the circle at the 
% location x and y. The color of the circle changes according to
% the color of the variable

% For comments, suggestions and Bugs: Contact: saurabh@vt.edu

% If you are using this code please cite it according to github rules.
function M = movie1()

frame = 1;
K = load('Output1D-1xv.txt');
writer = VideoWriter('movie_7part.avi');
open(writer);
for i = 1:10:4000
    x = [K(i,2) K(i,4)];% Determines the location of the circle
    v = [K(i,3) K(i,5)];% Determines the color of the circle
    M(frame) = circle(x,v,0.4,i,2);
    writeVideo(writer,M(frame));
    frame = frame+1;
    
end
i = 4000;
  x = [K(i,2) K(i,4)];% K(i,6) K(i,8) K(i,10) K(i,12) K(i,14)];
    v = [K(i,3) K(i,5)];% K(i,7) K(i,9) K(i,11) K(i,13) K(i,15)];
    M(frame) = circle7(x,v,0.4,i,num);
writeVideo(writer,M(frame));
frame = frame+1;


% movie2avi(M,'myavifile.avi','Compression','Cinepak');
close(writer);
end
