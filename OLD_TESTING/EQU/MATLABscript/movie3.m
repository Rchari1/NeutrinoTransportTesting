% Create a figure
fig = figure;

% Create a VideoWriter object
writerObj = VideoWriter('heatmap_movie.avi');
open(writerObj);

for idx = 1:9591
    % Plot heatmap on the figure
    heatmap(EQU_LOG_DAT(:,:,idx));
    
    % Capture the frame
    F = getframe(fig);
    
    % Write the frame to the video file
    writeVideo(writerObj, F);
end



%for idx = 1:9591
    % Plot heatmap on the figure
 %   heatmap(EQU_LOG_DAT(:,:,idx));
    
    % Capture the frame
  %  F = getframe(fig);
    
    % Write the frame to the video file
  %  writeVideo(writerObj, F);
%end

% Close the figure
close(fig);

% Close the video file
close(writerObj);

% Inform the user about the saved video file
disp('Movie saved as "heatmap_movie.avi".');