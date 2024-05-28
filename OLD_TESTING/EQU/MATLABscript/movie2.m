% Create a figure
fig = figure;


for idx = 1:9591
    % Plot heatmap on the figure
    heatmap(EQU_LOG_DAT(:,:,idx));
    
    % Capture the frame
    F = getframe(fig);
    
    % Write the frame to the video file
   M(idx) = F;
end


% Close the figure
close(fig);

% Create the movie
movie(M);


% Assuming EQU_LOG_DAT is your 3D matrix

% Create a figure
fig = figure;

% Determine the total number of frames
totalFrames = size(EQU_LOG_DAT, 3);

% Initialize the movie array
M = struct('cdata', cell(1, totalFrames), 'colormap', cell(1, totalFrames));

for idx = 1:totalFrames
    % Plot heatmap on the figure
    heatmap(EQU_LOG_DAT(:,:,idx));
    
    % Capture the frame
    F = getframe(fig);
    
    % Store the frame in the movie array
    M(idx) = F;
end

% Close the figure
close(fig);

% Create the movie
movie(M);
