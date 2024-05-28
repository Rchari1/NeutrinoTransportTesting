addpath( '/home/jared/Collisionator/Source' )

[ tVec, dtVec, dNVec, kVec, cMat, cycleVec, truecycleVec, nIterationsVec, nTrueIterationsVec, NMat, eC, Branch, EQU_Cond, dt_FE, dt_EA, dt_PE ]=GetTrace_Plotfile('/home/jared/Collisionator/Run/Output','PlotFile',0,100);

fig = figure;

numPlots = size(tVec, 1);

% Create a VideoWriter object
writerObj = VideoWriter('heatmap_movie.avi');
open(writerObj);


for i = 1:numPlots
    % Plot heatmap using imagesc
    imagesc(EQU_Cond(i,:));
    
    % Add text annotation for the current time
    text('Units', 'normalized', 'Position', [0.5, 1.05], 'String', ['Time: ' num2str(tVec(i))], 'HorizontalAlignment', 'center');
    
    % Capture the frame
    F = getframe(fig);
    
    % Write the frame to the video file
    M(i) = F;
    % Write the frame to the video file
    %writeVideo(writerObj, F);
end
% Close the figure
close(fig);

% Close the video file
%close(writerObj);

% Inform the user about the saved video file
%disp('Movie saved as "heatmap_movie.avi".');

% Create the movie
movie(M);

