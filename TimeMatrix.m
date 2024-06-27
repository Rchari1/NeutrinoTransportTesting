% Load the CSV file
data = readtable('wallclock_times.csv');

% Extract unique values of EpsA and EpsR
uniqueEpsA = unique(data.EpsA);
uniqueEpsR = unique(data.EpsR);

% Initialize the matrix to store wall-clock times
numEpsA = length(uniqueEpsA);
numEpsR = length(uniqueEpsR);
wallClockMatrix = nan(numEpsR, numEpsA);

% Populate the matrix with wall-clock times
for i = 1:height(data)
    % Find the indices of the current EpsA and EpsR in the unique arrays
    idxA = find(uniqueEpsA == data.EpsA(i));
    idxR = find(uniqueEpsR == data.EpsR(i));
    
    % Store the wall-clock time in the matrix
    wallClockMatrix(idxR, idxA) = data.WallClockTime(i);
end

% Display the matrix
disp('Wall-Clock Time Matrix:');
disp(wallClockMatrix);

% Plot the heatmap
figure;
heatmap(uniqueEpsA, uniqueEpsR, wallClockMatrix, 'Colormap', parula);
xlabel('EpsA');
ylabel('EpsR');
title('Wall-Clock Time Heatmap');
