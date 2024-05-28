close all
clear all

%addpath( '../Source' ); addpath( '../Data' );
addpath( '/home/jared/Collisionator/Source' )

i = 1;

%****************************
% Naming Convention:
% Initial conditions and approximation methods
% A: dt_grw = 1.01; B: dt_grw = 1.03; C: dt_grw = 1.07; D: dt_grw = 1.10
% _P: Predictor; _C: Corrector
%
% variables:
%t = time; dt = timestep; N = density; dN = change in density;
%TC = total cycles
%****************************

% Load data
[ tVec, dtVec, dNVec, kVec, cMat, cycleVec, truecycleVec, nIterationsVec, nTrueIterationsVec, NMat, eC, Branch, EQU_Cond, dt_FE, dt_EA, dt_PE ] = GetTrace_Plotfile('/home/jared/Collisionator/Run/Output', 'PlotFile', 0, 100);

% Create a figure
figure;
hold on;

% Use a color map with distinct colors
colors = parula(40);

% Plot each line with improved aesthetics
for i = 1:size(EQU_Cond, 2)
    % Adjust line style, color, and marker
    plot(tVec, EQU_Cond(:, i), 'Color', colors(i, :), 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 6, 'DisplayName', ['Plot ' num2str(i)]);
end

% Set axis properties
xlim([1e-8, 1e2]); % Set x-axis limits from 10^-8 to 10^2
ylim([0, 2]);
set(gca, 'XScale', 'log');

% Add labels and title
xlabel('Time');
ylabel('Equilibrium Conditions');
title('Equilibrium Conditions over Time');

% Add grid lines for better readability
grid on;

% Customize the appearance of the axes
ax = gca;
ax.FontSize = 12;
ax.LineWidth = 1.2;

% Add a background color to enhance contrast
ax.Color = [0.95, 0.95, 0.95];

% Add a box around the plot
box on;

% Place the legend on the right-hand side
legend('Location', 'EastOutside');
legend('boxoff'); % Remove legend box
