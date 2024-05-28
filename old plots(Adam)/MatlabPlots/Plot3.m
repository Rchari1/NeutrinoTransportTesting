addpath( '/home/jared/Collisionator/Source' )

% Load data
[ tVec, dtVec, dNVec, kVec, cMat, cycleVec, truecycleVec, nIterationsVec, nTrueIterationsVec, NMat, eC, Branch, EQU_Cond, dt_FE, dt_EA, dt_PE ] = GetTrace_Plotfile('/home/jared/Collisionator/Run/Output', 'PlotFile', 0, 100);

% Create a figure
fig = figure;

% Create a VideoWriter object
writerObj = VideoWriter('heatmap_movie.avi');
open(writerObj);

% Define the position for the first heatmap
heatmapPosition = [0.1, 0.6, 0.8, 0.3];

% Define the position for the second heatmap
populationHeatmapPosition = [0.1, 0.1, 0.8, 0.3];

for i = 1:size(tVec, 1)
    % Plot the first heatmap (Equilibrium conditions)
    subplot('Position', heatmapPosition);
    imagesc(EQU_Cond(i,:));
    colormap('hot');
    colorbar;
    set(gca, 'XScale', 'log');
    title('Equilibrium Energy Bins over Time');
    
    % Plot the second heatmap (Populations)
    subplot('Position', populationHeatmapPosition);
    imagesc(NMat(i, :));
    colormap('hot');
    colorbar;
    set(gca, 'XScale', 'log');
    title('Population over Time');
    
    % Add text annotation for the current time
    text('Units', 'normalized', 'Position', [0.5, 1.3], 'String', ['Time: ' num2str(tVec(i))], 'HorizontalAlignment', 'center');
    
    % Capture the frame
    F = getframe(fig);
    
    % Write the frame to the video file
    writeVideo(writerObj, F);
end

% Close the figure
close(fig);

% Close the video file
close(writerObj);

% Inform the user about the saved video file
disp('Movie saved as "heatmap_movie.avi."');
