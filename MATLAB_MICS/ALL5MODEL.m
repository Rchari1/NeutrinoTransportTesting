close all;
clear all;


addpath( 'C:\Users\adamh\Documents\GitHub\Collisionator\Source' );

iG = [ 1, 5, 15, 25, 35 ];

% Naming Convention:
% Initial conditions and approximation methods
% A: dt_grw = 1.01; B: dt_grw = 1.03; C: dt_grw = 1.07; D: dt_grw = 1.10
% _QSS1: Predictor; _QSS2: Corrector
% H: Model 1; I: Model 2; J: Model 3; K: Model 4;  L: Model 5; 
%
% variables:
%t = time; dt = timestep; N = density; dN = change in density;
%TC = total cycles
%****************************


%****************************
%QSS2    MODEL 1
%****************************

[t_1AH_QSS2, dt_1AH_QSS2, dN_1AH_QSS2,~,~,~, TC_1AH_QSS2,~,~,N_1AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\QSS2\dt_grw = 1.01\TOL = -1','PlotFile',0,100);

[t_2AH_QSS2, dt_2AH_QSS2, dN_2AH_QSS2,~,~,~, TC_2AH_QSS2,~,~,N_2AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\QSS2\dt_grw = 1.01\TOL = -2','PlotFile',0,100);

[t_3AH_QSS2, dt_3AH_QSS2, dN_3AH_QSS2,~,~,~, TC_3AH_QSS2,~,~,N_3AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -3','PlotFile',0,100);

[t_4AH_QSS2, dt_4AH_QSS2, dN_4AH_QSS2,~,~,~, TC_4AH_QSS2,~,~,N_4AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -4','PlotFile',0,100);

[t_5AH_QSS2, dt_5AH_QSS2, dN_5AH_QSS2,~,~,~, TC_5AH_QSS2,~,~,N_5AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -5','PlotFile',0,100);

[t_6AH_QSS2, dt_6AH_QSS2, dN_6AH_QSS2,~,~,~, TC_6AH_QSS2,~,~,N_6AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -6','PlotFile',0,100);

[t_7AH_QSS2, dt_7AH_QSS2, dN_7AH_QSS2,~,~,~, TC_7AH_QSS2,~,~,N_7AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -7','PlotFile',0,100);

[t_8AH_QSS2, dt_8AH_QSS2, dN_8AH_QSS2,~,~,~, TC_8AH_QSS2,~,~,N_8AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -8','PlotFile',0,100);

[t_9AH_QSS2, dt_9AH_QSS2, dN_9AH_QSS2,~,~,~, TC_9AH_QSS2,~,~,N_9AH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.01\TOL = -9','PlotFile',0,100);


[t_1BH_QSS2, dt_1BH_QSS2, dN_1BH_QSS2,~,~,~, TC_1BH_QSS2,~,~,N_1BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -1','PlotFile',0,100);

[t_2BH_QSS2, dt_2BH_QSS2, dN_2BH_QSS2,~,~,~, TC_2BH_QSS2,~,~,N_2BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -2','PlotFile',0,100);

[t_3BH_QSS2, dt_3BH_QSS2, dN_3BH_QSS2,~,~,~, TC_3BH_QSS2,~,~,N_3BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -3','PlotFile',0,100);

[t_4BH_QSS2, dt_4BH_QSS2, dN_4BH_QSS2,~,~,~, TC_4BH_QSS2,~,~,N_4BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -4','PlotFile',0,100);

[t_5BH_QSS2, dt_5BH_QSS2, dN_5BH_QSS2,~,~,~, TC_5BH_QSS2,~,~,N_5BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -5','PlotFile',0,100);

[t_6BH_QSS2, dt_6BH_QSS2, dN_6BH_QSS2,~,~,~, TC_6BH_QSS2,~,~,N_6BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -6','PlotFile',0,100);

[t_7BH_QSS2, dt_7BH_QSS2, dN_7BH_QSS2,~,~,~, TC_7BH_QSS2,~,~,N_7BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -7','PlotFile',0,100);

[t_8BH_QSS2, dt_8BH_QSS2, dN_8BH_QSS2,~,~,~, TC_8BH_QSS2,~,~,N_8BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -8','PlotFile',0,100);

[t_9BH_QSS2, dt_9BH_QSS2, dN_9BH_QSS2,~,~,~, TC_9BH_QSS2,~,~,N_9BH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.03\TOL = -9','PlotFile',0,100);


[t_1CH_QSS2, dt_1CH_QSS2, dN_1CH_QSS2,~,~,~, TC_1CH_QSS2,~,~,N_1CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -1','PlotFile',0,100);

[t_2CH_QSS2, dt_2CH_QSS2, dN_2CH_QSS2,~,~,~, TC_2CH_QSS2,~,~,N_2CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -2','PlotFile',0,100);

[t_3CH_QSS2, dt_3CH_QSS2, dN_3CH_QSS2,~,~,~, TC_3CH_QSS2,~,~,N_3CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -3','PlotFile',0,100);

[t_4CH_QSS2, dt_4CH_QSS2, dN_4CH_QSS2,~,~,~, TC_4CH_QSS2,~,~,N_4CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -4','PlotFile',0,100);

[t_5CH_QSS2, dt_5CH_QSS2, dN_5CH_QSS2,~,~,~, TC_5CH_QSS2,~,~,N_5CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -5','PlotFile',0,100);

[t_6CH_QSS2, dt_6CH_QSS2, dN_6CH_QSS2,~,~,~, TC_6CH_QSS2,~,~,N_6CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -6','PlotFile',0,100);

[t_7CH_QSS2, dt_7CH_QSS2, dN_7CH_QSS2,~,~,~, TC_7CH_QSS2,~,~,N_7CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -7','PlotFile',0,100);

[t_8CH_QSS2, dt_8CH_QSS2, dN_8CH_QSS2,~,~,~, TC_8CH_QSS2,~,~,N_8CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -8','PlotFile',0,100);

[t_9CH_QSS2, dt_9CH_QSS2, dN_9CH_QSS2,~,~,~, TC_9CH_QSS2,~,~,N_9CH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.07\TOL = -9','PlotFile',0,100);


[t_1DH_QSS2, dt_1DH_QSS2, dN_1DH_QSS2,~,~,~, TD_1DH_QSS2,~,~,N_1DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -1','PlotFile',0,100);

[t_2DH_QSS2, dt_2DH_QSS2, dN_2DH_QSS2,~,~,~, TC_2DH_QSS2,~,~,N_2DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -2','PlotFile',0,100);

[t_3DH_QSS2, dt_3DH_QSS2, dN_3DH_QSS2,~,~,~, TC_3DH_QSS2,~,~,N_3DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -3','PlotFile',0,100);

[t_4DH_QSS2, dt_4DH_QSS2, dN_4DH_QSS2,~,~,~, TC_4DH_QSS2,~,~,N_4DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -4','PlotFile',0,100);

[t_5DH_QSS2, dt_5DH_QSS2, dN_5DH_QSS2,~,~,~, TC_5DH_QSS2,~,~,N_5DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -5','PlotFile',0,100);

[t_6DH_QSS2, dt_6DH_QSS2, dN_6DH_QSS2,~,~,~, TC_6DH_QSS2,~,~,N_6DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -6','PlotFile',0,100);

[t_7DH_QSS2, dt_7DH_QSS2, dN_7DH_QSS2,~,~,~, TC_7DH_QSS2,~,~,N_7DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -7','PlotFile',0,100);

[t_8DH_QSS2, dt_8DH_QSS2, dN_8DH_QSS2,~,~,~, TC_8DH_QSS2,~,~,N_8DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -8','PlotFile',0,100);

[t_9DH_QSS2, dt_9DH_QSS2, dN_9DH_QSS2,~,~,~, TC_9DH_QSS2,~,~,N_9DH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.10\TOL = -9','PlotFile',0,100);


[t_1EH_QSS2, dt_1EH_QSS2, dN_1EH_QSS2,~,~,~, TD_1EH_QSS2,~,~,N_1EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -1','PlotFile',0,100);

[t_2EH_QSS2, dt_2EH_QSS2, dN_2EH_QSS2,~,~,~, TC_2EH_QSS2,~,~,N_2EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -2','PlotFile',0,100);

[t_3EH_QSS2, dt_3EH_QSS2, dN_3EH_QSS2,~,~,~, TC_3EH_QSS2,~,~,N_3EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -3','PlotFile',0,100);

[t_4EH_QSS2, dt_4EH_QSS2, dN_4EH_QSS2,~,~,~, TC_4EH_QSS2,~,~,N_4EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -4','PlotFile',0,100);

[t_5EH_QSS2, dt_5EH_QSS2, dN_5EH_QSS2,~,~,~, TC_5EH_QSS2,~,~,N_5EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -5','PlotFile',0,100);

[t_6EH_QSS2, dt_6EH_QSS2, dN_6EH_QSS2,~,~,~, TC_6EH_QSS2,~,~,N_6EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -6','PlotFile',0,100);

[t_7EH_QSS2, dt_7EH_QSS2, dN_7EH_QSS2,~,~,~, TC_7EH_QSS2,~,~,N_7EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -7','PlotFile',0,100);

[t_8EH_QSS2, dt_8EH_QSS2, dN_8EH_QSS2,~,~,~, TC_8EH_QSS2,~,~,N_8EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -8','PlotFile',0,100);

[t_9EH_QSS2, dt_9EH_QSS2, dN_9EH_QSS2,~,~,~, TC_9EH_QSS2,~,~,N_9EH_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_1\dt_grw = 1.20\TOL = -9','PlotFile',0,100);


%****************************
%QSS2    MODEL 2
%****************************


[t_1AI_QSS2, dt_1AI_QSS2, dN_1AI_QSS2,~,~,~, TC_1AI_QSS2,~,~,N_1AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -1','PlotFile',0,100);

[t_2AI_QSS2, dt_2AI_QSS2, dN_2AI_QSS2,~,~,~, TC_2AI_QSS2,~,~,N_2AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -2','PlotFile',0,100);

[t_3AI_QSS2, dt_3AI_QSS2, dN_3AI_QSS2,~,~,~, TC_3AI_QSS2,~,~,N_3AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -3','PlotFile',0,100);

[t_4AI_QSS2, dt_4AI_QSS2, dN_4AI_QSS2,~,~,~, TC_4AI_QSS2,~,~,N_4AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -4','PlotFile',0,100);

[t_5AI_QSS2, dt_5AI_QSS2, dN_5AI_QSS2,~,~,~, TC_5AI_QSS2,~,~,N_5AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -5','PlotFile',0,100);

[t_6AI_QSS2, dt_6AI_QSS2, dN_6AI_QSS2,~,~,~, TC_6AI_QSS2,~,~,N_6AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -6','PlotFile',0,100);

[t_7AI_QSS2, dt_7AI_QSS2, dN_7AI_QSS2,~,~,~, TC_7AI_QSS2,~,~,N_7AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -7','PlotFile',0,100);

[t_8AI_QSS2, dt_8AI_QSS2, dN_8AI_QSS2,~,~,~, TC_8AI_QSS2,~,~,N_8AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -8','PlotFile',0,100);

[t_9AI_QSS2, dt_9AI_QSS2, dN_9AI_QSS2,~,~,~, TC_9AI_QSS2,~,~,N_9AI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.01\TOL = -9','PlotFile',0,100);


[t_1BI_QSS2, dt_1BI_QSS2, dN_1BI_QSS2,~,~,~, TC_1BI_QSS2,~,~,N_1BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -1','PlotFile',0,100);

[t_2BI_QSS2, dt_2BI_QSS2, dN_2BI_QSS2,~,~,~, TC_2BI_QSS2,~,~,N_2BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -2','PlotFile',0,100);

[t_3BI_QSS2, dt_3BI_QSS2, dN_3BI_QSS2,~,~,~, TC_3BI_QSS2,~,~,N_3BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -3','PlotFile',0,100);

[t_4BI_QSS2, dt_4BI_QSS2, dN_4BI_QSS2,~,~,~, TC_4BI_QSS2,~,~,N_4BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -4','PlotFile',0,100);

[t_5BI_QSS2, dt_5BI_QSS2, dN_5BI_QSS2,~,~,~, TC_5BI_QSS2,~,~,N_5BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -5','PlotFile',0,100);

[t_6BI_QSS2, dt_6BI_QSS2, dN_6BI_QSS2,~,~,~, TC_6BI_QSS2,~,~,N_6BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -6','PlotFile',0,100);

[t_7BI_QSS2, dt_7BI_QSS2, dN_7BI_QSS2,~,~,~, TC_7BI_QSS2,~,~,N_7BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -7','PlotFile',0,100);

[t_8BI_QSS2, dt_8BI_QSS2, dN_8BI_QSS2,~,~,~, TC_8BI_QSS2,~,~,N_8BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -8','PlotFile',0,100);

[t_9BI_QSS2, dt_9BI_QSS2, dN_9BI_QSS2,~,~,~, TC_9BI_QSS2,~,~,N_9BI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.03\TOL = -9','PlotFile',0,100);


[t_1CI_QSS2, dt_1CI_QSS2, dN_1CI_QSS2,~,~,~, TC_1CI_QSS2,~,~,N_1CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -1','PlotFile',0,100);

[t_2CI_QSS2, dt_2CI_QSS2, dN_2CI_QSS2,~,~,~, TC_2CI_QSS2,~,~,N_2CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -2','PlotFile',0,100);

[t_3CI_QSS2, dt_3CI_QSS2, dN_3CI_QSS2,~,~,~, TC_3CI_QSS2,~,~,N_3CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -3','PlotFile',0,100);

[t_4CI_QSS2, dt_4CI_QSS2, dN_4CI_QSS2,~,~,~, TC_4CI_QSS2,~,~,N_4CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -4','PlotFile',0,100);

[t_5CI_QSS2, dt_5CI_QSS2, dN_5CI_QSS2,~,~,~, TC_5CI_QSS2,~,~,N_5CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -5','PlotFile',0,100);

[t_6CI_QSS2, dt_6CI_QSS2, dN_6CI_QSS2,~,~,~, TC_6CI_QSS2,~,~,N_6CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -6','PlotFile',0,100);

[t_7CI_QSS2, dt_7CI_QSS2, dN_7CI_QSS2,~,~,~, TC_7CI_QSS2,~,~,N_7CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -7','PlotFile',0,100);

[t_8CI_QSS2, dt_8CI_QSS2, dN_8CI_QSS2,~,~,~, TC_8CI_QSS2,~,~,N_8CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -8','PlotFile',0,100);

[t_9CI_QSS2, dt_9CI_QSS2, dN_9CI_QSS2,~,~,~, TC_9CI_QSS2,~,~,N_9CI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.07\TOL = -9','PlotFile',0,100);


[t_1DI_QSS2, dt_1DI_QSS2, dN_1DI_QSS2,~,~,~, TD_1DI_QSS2,~,~,N_1DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -1','PlotFile',0,100);

[t_2DI_QSS2, dt_2DI_QSS2, dN_2DI_QSS2,~,~,~, TC_2DI_QSS2,~,~,N_2DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -2','PlotFile',0,100);

[t_3DI_QSS2, dt_3DI_QSS2, dN_3DI_QSS2,~,~,~, TC_3DI_QSS2,~,~,N_3DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -3','PlotFile',0,100);

[t_4DI_QSS2, dt_4DI_QSS2, dN_4DI_QSS2,~,~,~, TC_4DI_QSS2,~,~,N_4DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -4','PlotFile',0,100);

[t_5DI_QSS2, dt_5DI_QSS2, dN_5DI_QSS2,~,~,~, TC_5DI_QSS2,~,~,N_5DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -5','PlotFile',0,100);

[t_6DI_QSS2, dt_6DI_QSS2, dN_6DI_QSS2,~,~,~, TC_6DI_QSS2,~,~,N_6DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -6','PlotFile',0,100);

[t_7DI_QSS2, dt_7DI_QSS2, dN_7DI_QSS2,~,~,~, TC_7DI_QSS2,~,~,N_7DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -7','PlotFile',0,100);

[t_8DI_QSS2, dt_8DI_QSS2, dN_8DI_QSS2,~,~,~, TC_8DI_QSS2,~,~,N_8DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -8','PlotFile',0,100);

[t_9DI_QSS2, dt_9DI_QSS2, dN_9DI_QSS2,~,~,~, TC_9DI_QSS2,~,~,N_9DI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.10\TOL = -9','PlotFile',0,100);


[t_1EI_QSS2, dt_1EI_QSS2, dN_1EI_QSS2,~,~,~, TD_1EI_QSS2,~,~,N_1EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -1','PlotFile',0,100);

[t_2EI_QSS2, dt_2EI_QSS2, dN_2EI_QSS2,~,~,~, TC_2EI_QSS2,~,~,N_2EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -2','PlotFile',0,100);

[t_3EI_QSS2, dt_3EI_QSS2, dN_3EI_QSS2,~,~,~, TC_3EI_QSS2,~,~,N_3EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -3','PlotFile',0,100);

[t_4EI_QSS2, dt_4EI_QSS2, dN_4EI_QSS2,~,~,~, TC_4EI_QSS2,~,~,N_4EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -4','PlotFile',0,100);

[t_5EI_QSS2, dt_5EI_QSS2, dN_5EI_QSS2,~,~,~, TC_5EI_QSS2,~,~,N_5EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -5','PlotFile',0,100);

[t_6EI_QSS2, dt_6EI_QSS2, dN_6EI_QSS2,~,~,~, TC_6EI_QSS2,~,~,N_6EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -6','PlotFile',0,100);

[t_7EI_QSS2, dt_7EI_QSS2, dN_7EI_QSS2,~,~,~, TC_7EI_QSS2,~,~,N_7EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -7','PlotFile',0,100);

[t_8EI_QSS2, dt_8EI_QSS2, dN_8EI_QSS2,~,~,~, TC_8EI_QSS2,~,~,N_8EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -8','PlotFile',0,100);

[t_9EI_QSS2, dt_9EI_QSS2, dN_9EI_QSS2,~,~,~, TC_9EI_QSS2,~,~,N_9EI_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_2\dt_grw = 1.20\TOL = -9','PlotFile',0,100);


%****************************
%QSS2    MODEL 3
%****************************

[t_1AJ_QSS2, dt_1AJ_QSS2, dN_1AJ_QSS2,~,~,~, TC_1AJ_QSS2,~,~,N_1AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -1','PlotFile',0,100);

[t_2AJ_QSS2, dt_2AJ_QSS2, dN_2AJ_QSS2,~,~,~, TC_2AJ_QSS2,~,~,N_2AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -2','PlotFile',0,100);

[t_3AJ_QSS2, dt_3AJ_QSS2, dN_3AJ_QSS2,~,~,~, TC_3AJ_QSS2,~,~,N_3AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -3','PlotFile',0,100);

[t_4AJ_QSS2, dt_4AJ_QSS2, dN_4AJ_QSS2,~,~,~, TC_4AJ_QSS2,~,~,N_4AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -4','PlotFile',0,100);

[t_5AJ_QSS2, dt_5AJ_QSS2, dN_5AJ_QSS2,~,~,~, TC_5AJ_QSS2,~,~,N_5AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -5','PlotFile',0,100);

[t_6AJ_QSS2, dt_6AJ_QSS2, dN_6AJ_QSS2,~,~,~, TC_6AJ_QSS2,~,~,N_6AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -6','PlotFile',0,100);

[t_7AJ_QSS2, dt_7AJ_QSS2, dN_7AJ_QSS2,~,~,~, TC_7AJ_QSS2,~,~,N_7AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -7','PlotFile',0,100);

[t_8AJ_QSS2, dt_8AJ_QSS2, dN_8AJ_QSS2,~,~,~, TC_8AJ_QSS2,~,~,N_8AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -8','PlotFile',0,100);

[t_9AJ_QSS2, dt_9AJ_QSS2, dN_9AJ_QSS2,~,~,~, TC_9AJ_QSS2,~,~,N_9AJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.01\TOL = -9','PlotFile',0,100);


[t_1BJ_QSS2, dt_1BJ_QSS2, dN_1BJ_QSS2,~,~,~, TC_1BJ_QSS2,~,~,N_1BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -1','PlotFile',0,100);

[t_2BJ_QSS2, dt_2BJ_QSS2, dN_2BJ_QSS2,~,~,~, TC_2BJ_QSS2,~,~,N_2BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -2','PlotFile',0,100);

[t_3BJ_QSS2, dt_3BJ_QSS2, dN_3BJ_QSS2,~,~,~, TC_3BJ_QSS2,~,~,N_3BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -3','PlotFile',0,100);

[t_4BJ_QSS2, dt_4BJ_QSS2, dN_4BJ_QSS2,~,~,~, TC_4BJ_QSS2,~,~,N_4BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -4','PlotFile',0,100);

[t_5BJ_QSS2, dt_5BJ_QSS2, dN_5BJ_QSS2,~,~,~, TC_5BJ_QSS2,~,~,N_5BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -5','PlotFile',0,100);

[t_6BJ_QSS2, dt_6BJ_QSS2, dN_6BJ_QSS2,~,~,~, TC_6BJ_QSS2,~,~,N_6BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -6','PlotFile',0,100);

[t_7BJ_QSS2, dt_7BJ_QSS2, dN_7BJ_QSS2,~,~,~, TC_7BJ_QSS2,~,~,N_7BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -7','PlotFile',0,100);

[t_8BJ_QSS2, dt_8BJ_QSS2, dN_8BJ_QSS2,~,~,~, TC_8BJ_QSS2,~,~,N_8BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -8','PlotFile',0,100);

[t_9BJ_QSS2, dt_9BJ_QSS2, dN_9BJ_QSS2,~,~,~, TC_9BJ_QSS2,~,~,N_9BJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.03\TOL = -9','PlotFile',0,100);


[t_1CJ_QSS2, dt_1CJ_QSS2, dN_1CJ_QSS2,~,~,~, TC_1CJ_QSS2,~,~,N_1CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -1','PlotFile',0,100);

[t_2CJ_QSS2, dt_2CJ_QSS2, dN_2CJ_QSS2,~,~,~, TC_2CJ_QSS2,~,~,N_2CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -2','PlotFile',0,100);

[t_3CJ_QSS2, dt_3CJ_QSS2, dN_3CJ_QSS2,~,~,~, TC_3CJ_QSS2,~,~,N_3CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -3','PlotFile',0,100);

[t_4CJ_QSS2, dt_4CJ_QSS2, dN_4CJ_QSS2,~,~,~, TC_4CJ_QSS2,~,~,N_4CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -4','PlotFile',0,100);

[t_5CJ_QSS2, dt_5CJ_QSS2, dN_5CJ_QSS2,~,~,~, TC_5CJ_QSS2,~,~,N_5CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -5','PlotFile',0,100);

[t_6CJ_QSS2, dt_6CJ_QSS2, dN_6CJ_QSS2,~,~,~, TC_6CJ_QSS2,~,~,N_6CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -6','PlotFile',0,100);

[t_7CJ_QSS2, dt_7CJ_QSS2, dN_7CJ_QSS2,~,~,~, TC_7CJ_QSS2,~,~,N_7CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -7','PlotFile',0,100);

[t_8CJ_QSS2, dt_8CJ_QSS2, dN_8CJ_QSS2,~,~,~, TC_8CJ_QSS2,~,~,N_8CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -8','PlotFile',0,100);

[t_9CJ_QSS2, dt_9CJ_QSS2, dN_9CJ_QSS2,~,~,~, TC_9CJ_QSS2,~,~,N_9CJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.07\TOL = -9','PlotFile',0,100);


[t_1DJ_QSS2, dt_1DJ_QSS2, dN_1DJ_QSS2,~,~,~, TD_1DJ_QSS2,~,~,N_1DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -1','PlotFile',0,100);

[t_2DJ_QSS2, dt_2DJ_QSS2, dN_2DJ_QSS2,~,~,~, TC_2DJ_QSS2,~,~,N_2DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -2','PlotFile',0,100);

[t_3DJ_QSS2, dt_3DJ_QSS2, dN_3DJ_QSS2,~,~,~, TC_3DJ_QSS2,~,~,N_3DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -3','PlotFile',0,100);

[t_4DJ_QSS2, dt_4DJ_QSS2, dN_4DJ_QSS2,~,~,~, TC_4DJ_QSS2,~,~,N_4DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -4','PlotFile',0,100);

[t_5DJ_QSS2, dt_5DJ_QSS2, dN_5DJ_QSS2,~,~,~, TC_5DJ_QSS2,~,~,N_5DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -5','PlotFile',0,100);

[t_6DJ_QSS2, dt_6DJ_QSS2, dN_6DJ_QSS2,~,~,~, TC_6DJ_QSS2,~,~,N_6DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -6','PlotFile',0,100);

[t_7DJ_QSS2, dt_7DJ_QSS2, dN_7DJ_QSS2,~,~,~, TC_7DJ_QSS2,~,~,N_7DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -7','PlotFile',0,100);

[t_8DJ_QSS2, dt_8DJ_QSS2, dN_8DJ_QSS2,~,~,~, TC_8DJ_QSS2,~,~,N_8DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -8','PlotFile',0,100);

[t_9DJ_QSS2, dt_9DJ_QSS2, dN_9DJ_QSS2,~,~,~, TC_9DJ_QSS2,~,~,N_9DJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.10\TOL = -9','PlotFile',0,100);



[t_1EJ_QSS2, dt_1EJ_QSS2, dN_1EJ_QSS2,~,~,~, TD_1EJ_QSS2,~,~,N_1EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -1','PlotFile',0,100);

[t_2EJ_QSS2, dt_2EJ_QSS2, dN_2EJ_QSS2,~,~,~, TC_2EJ_QSS2,~,~,N_2EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -2','PlotFile',0,100);

[t_3EJ_QSS2, dt_3EJ_QSS2, dN_3EJ_QSS2,~,~,~, TC_3EJ_QSS2,~,~,N_3EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -3','PlotFile',0,100);

[t_4EJ_QSS2, dt_4EJ_QSS2, dN_4EJ_QSS2,~,~,~, TC_4EJ_QSS2,~,~,N_4EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -4','PlotFile',0,100);

[t_5EJ_QSS2, dt_5EJ_QSS2, dN_5EJ_QSS2,~,~,~, TC_5EJ_QSS2,~,~,N_5EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -5','PlotFile',0,100);

[t_6EJ_QSS2, dt_6EJ_QSS2, dN_6EJ_QSS2,~,~,~, TC_6EJ_QSS2,~,~,N_6EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -6','PlotFile',0,100);

[t_7EJ_QSS2, dt_7EJ_QSS2, dN_7EJ_QSS2,~,~,~, TC_7EJ_QSS2,~,~,N_7EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -7','PlotFile',0,100);

[t_8EJ_QSS2, dt_8EJ_QSS2, dN_8EJ_QSS2,~,~,~, TC_8EJ_QSS2,~,~,N_8EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -8','PlotFile',0,100);

[t_9EJ_QSS2, dt_9EJ_QSS2, dN_9EJ_QSS2,~,~,~, TC_9EJ_QSS2,~,~,N_9EJ_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_3\dt_grw = 1.20\TOL = -9','PlotFile',0,100);



%****************************
%QSS2    MODEL 4
%****************************


[t_1AK_QSS2, dt_1AK_QSS2, dN_1AK_QSS2,~,~,~, TC_1AK_QSS2,~,~,N_1AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -1','PlotFile',0,100);

[t_2AK_QSS2, dt_2AK_QSS2, dN_2AK_QSS2,~,~,~, TC_2AK_QSS2,~,~,N_2AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -2','PlotFile',0,100);

[t_3AK_QSS2, dt_3AK_QSS2, dN_3AK_QSS2,~,~,~, TC_3AK_QSS2,~,~,N_3AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -3','PlotFile',0,100);

[t_4AK_QSS2, dt_4AK_QSS2, dN_4AK_QSS2,~,~,~, TC_4AK_QSS2,~,~,N_4AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -4','PlotFile',0,100);

[t_5AK_QSS2, dt_5AK_QSS2, dN_5AK_QSS2,~,~,~, TC_5AK_QSS2,~,~,N_5AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -5','PlotFile',0,100);

[t_6AK_QSS2, dt_6AK_QSS2, dN_6AK_QSS2,~,~,~, TC_6AK_QSS2,~,~,N_6AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -6','PlotFile',0,100);

[t_7AK_QSS2, dt_7AK_QSS2, dN_7AK_QSS2,~,~,~, TC_7AK_QSS2,~,~,N_7AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -7','PlotFile',0,100);

[t_8AK_QSS2, dt_8AK_QSS2, dN_8AK_QSS2,~,~,~, TC_8AK_QSS2,~,~,N_8AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -8','PlotFile',0,100);

[t_9AK_QSS2, dt_9AK_QSS2, dN_9AK_QSS2,~,~,~, TC_9AK_QSS2,~,~,N_9AK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.01\TOL = -9','PlotFile',0,100);


[t_1BK_QSS2, dt_1BK_QSS2, dN_1BK_QSS2,~,~,~, TC_1BK_QSS2,~,~,N_1BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -1','PlotFile',0,100);

[t_2BK_QSS2, dt_2BK_QSS2, dN_2BK_QSS2,~,~,~, TC_2BK_QSS2,~,~,N_2BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -2','PlotFile',0,100);

[t_3BK_QSS2, dt_3BK_QSS2, dN_3BK_QSS2,~,~,~, TC_3BK_QSS2,~,~,N_3BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -3','PlotFile',0,100);

[t_4BK_QSS2, dt_4BK_QSS2, dN_4BK_QSS2,~,~,~, TC_4BK_QSS2,~,~,N_4BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -4','PlotFile',0,100);

[t_5BK_QSS2, dt_5BK_QSS2, dN_5BK_QSS2,~,~,~, TC_5BK_QSS2,~,~,N_5BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -5','PlotFile',0,100);

[t_6BK_QSS2, dt_6BK_QSS2, dN_6BK_QSS2,~,~,~, TC_6BK_QSS2,~,~,N_6BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -6','PlotFile',0,100);

[t_7BK_QSS2, dt_7BK_QSS2, dN_7BK_QSS2,~,~,~, TC_7BK_QSS2,~,~,N_7BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -7','PlotFile',0,100);

[t_8BK_QSS2, dt_8BK_QSS2, dN_8BK_QSS2,~,~,~, TC_8BK_QSS2,~,~,N_8BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -8','PlotFile',0,100);

[t_9BK_QSS2, dt_9BK_QSS2, dN_9BK_QSS2,~,~,~, TC_9BK_QSS2,~,~,N_9BK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.03\TOL = -9','PlotFile',0,100);


[t_1CK_QSS2, dt_1CK_QSS2, dN_1CK_QSS2,~,~,~, TC_1CK_QSS2,~,~,N_1CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -1','PlotFile',0,100);

[t_2CK_QSS2, dt_2CK_QSS2, dN_2CK_QSS2,~,~,~, TC_2CK_QSS2,~,~,N_2CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -2','PlotFile',0,100);

[t_3CK_QSS2, dt_3CK_QSS2, dN_3CK_QSS2,~,~,~, TC_3CK_QSS2,~,~,N_3CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -3','PlotFile',0,100);

[t_4CK_QSS2, dt_4CK_QSS2, dN_4CK_QSS2,~,~,~, TC_4CK_QSS2,~,~,N_4CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -4','PlotFile',0,100);

[t_5CK_QSS2, dt_5CK_QSS2, dN_5CK_QSS2,~,~,~, TC_5CK_QSS2,~,~,N_5CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -5','PlotFile',0,100);

[t_6CK_QSS2, dt_6CK_QSS2, dN_6CK_QSS2,~,~,~, TC_6CK_QSS2,~,~,N_6CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -6','PlotFile',0,100);

[t_7CK_QSS2, dt_7CK_QSS2, dN_7CK_QSS2,~,~,~, TC_7CK_QSS2,~,~,N_7CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -7','PlotFile',0,100);

[t_8CK_QSS2, dt_8CK_QSS2, dN_8CK_QSS2,~,~,~, TC_8CK_QSS2,~,~,N_8CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -8','PlotFile',0,100);

[t_9CK_QSS2, dt_9CK_QSS2, dN_9CK_QSS2,~,~,~, TC_9CK_QSS2,~,~,N_9CK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.07\TOL = -9','PlotFile',0,100);


[t_1DK_QSS2, dt_1DK_QSS2, dN_1DK_QSS2,~,~,~, TD_1DK_QSS2,~,~,N_1DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -1','PlotFile',0,100);

[t_2DK_QSS2, dt_2DK_QSS2, dN_2DK_QSS2,~,~,~, TC_2DK_QSS2,~,~,N_2DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -2','PlotFile',0,100);

[t_3DK_QSS2, dt_3DK_QSS2, dN_3DK_QSS2,~,~,~, TC_3DK_QSS2,~,~,N_3DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -3','PlotFile',0,100);

[t_4DK_QSS2, dt_4DK_QSS2, dN_4DK_QSS2,~,~,~, TC_4DK_QSS2,~,~,N_4DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -4','PlotFile',0,100);

[t_5DK_QSS2, dt_5DK_QSS2, dN_5DK_QSS2,~,~,~, TC_5DK_QSS2,~,~,N_5DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -5','PlotFile',0,100);

[t_6DK_QSS2, dt_6DK_QSS2, dN_6DK_QSS2,~,~,~, TC_6DK_QSS2,~,~,N_6DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -6','PlotFile',0,100);

[t_7DK_QSS2, dt_7DK_QSS2, dN_7DK_QSS2,~,~,~, TC_7DK_QSS2,~,~,N_7DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -7','PlotFile',0,100);

[t_8DK_QSS2, dt_8DK_QSS2, dN_8DK_QSS2,~,~,~, TC_8DK_QSS2,~,~,N_8DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -8','PlotFile',0,100);

[t_9DK_QSS2, dt_9DK_QSS2, dN_9DK_QSS2,~,~,~, TC_9DK_QSS2,~,~,N_9DK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.10\TOL = -9','PlotFile',0,100);



[t_1EK_QSS2, dt_1EK_QSS2, dN_1EK_QSS2,~,~,~, TD_1EK_QSS2,~,~,N_1EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -1','PlotFile',0,100);

[t_2EK_QSS2, dt_2EK_QSS2, dN_2EK_QSS2,~,~,~, TC_2EK_QSS2,~,~,N_2EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -2','PlotFile',0,100);

[t_3EK_QSS2, dt_3EK_QSS2, dN_3EK_QSS2,~,~,~, TC_3EK_QSS2,~,~,N_3EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -3','PlotFile',0,100);

[t_4EK_QSS2, dt_4EK_QSS2, dN_4EK_QSS2,~,~,~, TC_4EK_QSS2,~,~,N_4EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -4','PlotFile',0,100);

[t_5EK_QSS2, dt_5EK_QSS2, dN_5EK_QSS2,~,~,~, TC_5EK_QSS2,~,~,N_5EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -5','PlotFile',0,100);

[t_6EK_QSS2, dt_6EK_QSS2, dN_6EK_QSS2,~,~,~, TC_6EK_QSS2,~,~,N_6EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -6','PlotFile',0,100);

[t_7EK_QSS2, dt_7EK_QSS2, dN_7EK_QSS2,~,~,~, TC_7EK_QSS2,~,~,N_7EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -7','PlotFile',0,100);

[t_8EK_QSS2, dt_8EK_QSS2, dN_8EK_QSS2,~,~,~, TC_8EK_QSS2,~,~,N_8EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -8','PlotFile',0,100);

[t_9EK_QSS2, dt_9EK_QSS2, dN_9EK_QSS2,~,~,~, TC_9EK_QSS2,~,~,N_9EK_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_4\dt_grw = 1.20\TOL = -9','PlotFile',0,100);



%****************************
%QSS2    MODEL 5
%****************************


[t_1AL_QSS2, dt_1AL_QSS2, dN_1AL_QSS2,~,~,~, TC_1AL_QSS2,~,~,N_1AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -1','PlotFile',0,100);

[t_2AL_QSS2, dt_2AL_QSS2, dN_2AL_QSS2,~,~,~, TC_2AL_QSS2,~,~,N_2AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -2','PlotFile',0,100);

[t_3AL_QSS2, dt_3AL_QSS2, dN_3AL_QSS2,~,~,~, TC_3AL_QSS2,~,~,N_3AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -3','PlotFile',0,100);

[t_4AL_QSS2, dt_4AL_QSS2, dN_4AL_QSS2,~,~,~, TC_4AL_QSS2,~,~,N_4AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -4','PlotFile',0,100);

[t_5AL_QSS2, dt_5AL_QSS2, dN_5AL_QSS2,~,~,~, TC_5AL_QSS2,~,~,N_5AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -5','PlotFile',0,100);

[t_6AL_QSS2, dt_6AL_QSS2, dN_6AL_QSS2,~,~,~, TC_6AL_QSS2,~,~,N_6AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -6','PlotFile',0,100);

[t_7AL_QSS2, dt_7AL_QSS2, dN_7AL_QSS2,~,~,~, TC_7AL_QSS2,~,~,N_7AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -7','PlotFile',0,100);

[t_8AL_QSS2, dt_8AL_QSS2, dN_8AL_QSS2,~,~,~, TC_8AL_QSS2,~,~,N_8AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -8','PlotFile',0,100);

[t_9AL_QSS2, dt_9AL_QSS2, dN_9AL_QSS2,~,~,~, TC_9AL_QSS2,~,~,N_9AL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.01\TOL = -9','PlotFile',0,100);


[t_1BL_QSS2, dt_1BL_QSS2, dN_1BL_QSS2,~,~,~, TC_1BL_QSS2,~,~,N_1BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -1','PlotFile',0,100);

[t_2BL_QSS2, dt_2BL_QSS2, dN_2BL_QSS2,~,~,~, TC_2BL_QSS2,~,~,N_2BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -2','PlotFile',0,100);

[t_3BL_QSS2, dt_3BL_QSS2, dN_3BL_QSS2,~,~,~, TC_3BL_QSS2,~,~,N_3BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -3','PlotFile',0,100);

[t_4BL_QSS2, dt_4BL_QSS2, dN_4BL_QSS2,~,~,~, TC_4BL_QSS2,~,~,N_4BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -4','PlotFile',0,100);

[t_5BL_QSS2, dt_5BL_QSS2, dN_5BL_QSS2,~,~,~, TC_5BL_QSS2,~,~,N_5BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -5','PlotFile',0,100);

[t_6BL_QSS2, dt_6BL_QSS2, dN_6BL_QSS2,~,~,~, TC_6BL_QSS2,~,~,N_6BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -6','PlotFile',0,100);

[t_7BL_QSS2, dt_7BL_QSS2, dN_7BL_QSS2,~,~,~, TC_7BL_QSS2,~,~,N_7BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -7','PlotFile',0,100);

[t_8BL_QSS2, dt_8BL_QSS2, dN_8BL_QSS2,~,~,~, TC_8BL_QSS2,~,~,N_8BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -8','PlotFile',0,100);

[t_9BL_QSS2, dt_9BL_QSS2, dN_9BL_QSS2,~,~,~, TC_9BL_QSS2,~,~,N_9BL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.03\TOL = -9','PlotFile',0,100);


[t_1CL_QSS2, dt_1CL_QSS2, dN_1CL_QSS2,~,~,~, TC_1CL_QSS2,~,~,N_1CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -1','PlotFile',0,100);

[t_2CL_QSS2, dt_2CL_QSS2, dN_2CL_QSS2,~,~,~, TC_2CL_QSS2,~,~,N_2CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -2','PlotFile',0,100);

[t_3CL_QSS2, dt_3CL_QSS2, dN_3CL_QSS2,~,~,~, TC_3CL_QSS2,~,~,N_3CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -3','PlotFile',0,100);

[t_4CL_QSS2, dt_4CL_QSS2, dN_4CL_QSS2,~,~,~, TC_4CL_QSS2,~,~,N_4CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -4','PlotFile',0,100);

[t_5CL_QSS2, dt_5CL_QSS2, dN_5CL_QSS2,~,~,~, TC_5CL_QSS2,~,~,N_5CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -5','PlotFile',0,100);

[t_6CL_QSS2, dt_6CL_QSS2, dN_6CL_QSS2,~,~,~, TC_6CL_QSS2,~,~,N_6CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -6','PlotFile',0,100);

[t_7CL_QSS2, dt_7CL_QSS2, dN_7CL_QSS2,~,~,~, TC_7CL_QSS2,~,~,N_7CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -7','PlotFile',0,100);

[t_8CL_QSS2, dt_8CL_QSS2, dN_8CL_QSS2,~,~,~, TC_8CL_QSS2,~,~,N_8CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -8','PlotFile',0,100);

[t_9CL_QSS2, dt_9CL_QSS2, dN_9CL_QSS2,~,~,~, TC_9CL_QSS2,~,~,N_9CL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.07\TOL = -9','PlotFile',0,100);


[t_1DL_QSS2, dt_1DL_QSS2, dN_1DL_QSS2,~,~,~, TD_1DL_QSS2,~,~,N_1DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -1','PlotFile',0,100);

[t_2DL_QSS2, dt_2DL_QSS2, dN_2DL_QSS2,~,~,~, TC_2DL_QSS2,~,~,N_2DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -2','PlotFile',0,100);

[t_3DL_QSS2, dt_3DL_QSS2, dN_3DL_QSS2,~,~,~, TC_3DL_QSS2,~,~,N_3DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -3','PlotFile',0,100);

[t_4DL_QSS2, dt_4DL_QSS2, dN_4DL_QSS2,~,~,~, TC_4DL_QSS2,~,~,N_4DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -4','PlotFile',0,100);

[t_5DL_QSS2, dt_5DL_QSS2, dN_5DL_QSS2,~,~,~, TC_5DL_QSS2,~,~,N_5DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -5','PlotFile',0,100);

[t_6DL_QSS2, dt_6DL_QSS2, dN_6DL_QSS2,~,~,~, TC_6DL_QSS2,~,~,N_6DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -6','PlotFile',0,100);

[t_7DL_QSS2, dt_7DL_QSS2, dN_7DL_QSS2,~,~,~, TC_7DL_QSS2,~,~,N_7DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -7','PlotFile',0,100);

[t_8DL_QSS2, dt_8DL_QSS2, dN_8DL_QSS2,~,~,~, TC_8DL_QSS2,~,~,N_8DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -8','PlotFile',0,100);

[t_9DL_QSS2, dt_9DL_QSS2, dN_9DL_QSS2,~,~,~, TC_9DL_QSS2,~,~,N_9DL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.10\TOL = -9','PlotFile',0,100);


[t_1EL_QSS2, dt_1EL_QSS2, dN_1EL_QSS2,~,~,~, TD_1EL_QSS2,~,~,N_1EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -1','PlotFile',0,100);

[t_2EL_QSS2, dt_2EL_QSS2, dN_2EL_QSS2,~,~,~, TC_2EL_QSS2,~,~,N_2EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -2','PlotFile',0,100);

[t_3EL_QSS2, dt_3EL_QSS2, dN_3EL_QSS2,~,~,~, TC_3EL_QSS2,~,~,N_3EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -3','PlotFile',0,100);

[t_4EL_QSS2, dt_4EL_QSS2, dN_4EL_QSS2,~,~,~, TC_4EL_QSS2,~,~,N_4EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -4','PlotFile',0,100);

[t_5EL_QSS2, dt_5EL_QSS2, dN_5EL_QSS2,~,~,~, TC_5EL_QSS2,~,~,N_5EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -5','PlotFile',0,100);

[t_6EL_QSS2, dt_6EL_QSS2, dN_6EL_QSS2,~,~,~, TC_6EL_QSS2,~,~,N_6EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -6','PlotFile',0,100);

[t_7EL_QSS2, dt_7EL_QSS2, dN_7EL_QSS2,~,~,~, TC_7EL_QSS2,~,~,N_7EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -7','PlotFile',0,100);

[t_8EL_QSS2, dt_8EL_QSS2, dN_8EL_QSS2,~,~,~, TC_8EL_QSS2,~,~,N_8EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -8','PlotFile',0,100);

[t_9EL_QSS2, dt_9EL_QSS2, dN_9EL_QSS2,~,~,~, TC_9EL_QSS2,~,~,N_9EL_QSS2 ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\QSS2\Model_5\dt_grw = 1.20\TOL = -9','PlotFile',0,100);



%****************************
%FE
% %****************************
 [t_FE_AH,dt_FE_AH,dN_FE_AH,~,~,~,~,~,~,N_FE_AH]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_1\dt_grw = 1.01','PlotFile',0,95);
 
 [t_FE_BH,dt_FE_BH,dN_FE_BH,~,~,~,~,~,~,N_FE_BH]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_1\dt_grw = 1.03','PlotFile',0,100);
 
 [t_FE_CH,dt_FE_CH,dN_FE_CH,~,~,~,~,~,~,N_FE_CH]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_1\dt_grw = 1.07','PlotFile',0,100);
 
 [t_FE_DH,dt_FE_DH,dN_FE_DH,~,~,~,~,~,~,N_FE_DH]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_1\dt_grw = 1.10','PlotFile',0,100);
 
 [t_FE_EH,dt_FE_EH,dN_FE_EH,~,~,~,~,~,~,N_FE_EH]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_1\dt_grw = 1.10','PlotFile',0,100);
 
 
 
% [t_FE_AI,dt_FE_AI,dN_FE_AI,~,~,~,~,~,~,N_FE_AI]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_2\dt_grw = 1.01','PlotFile',0,95);
% 
% [t_FE_BI,dt_FE_BI,dN_FE_BI,~,~,~,~,~,~,N_FE_BI]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_2\dt_grw = 1.03','PlotFile',0,100);
% 
% [t_FE_CI,dt_FE_CI,dN_FE_CI,~,~,~,~,~,~,N_FE_CI]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_2\dt_grw = 1.07','PlotFile',0,100);
% 
% [t_FE_DI,dt_FE_DI,dN_FE_DI,~,~,~,~,~,~,N_FE_DI]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_2\dt_grw = 1.10','PlotFile',0,100);
% 
% [t_FE_EI,dt_FE_EI,dN_FE_EI,~,~,~,~,~,~,N_FE_EI]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_2\dt_grw = 1.10','PlotFile',0,100);
 
 
 
 [t_FE_AJ,dt_FE_AJ,dN_FE_AJ,~,~,~,~,~,~,N_FE_AJ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_3\dt_grw = 1.01','PlotFile',0,95);
 
 [t_FE_BJ,dt_FE_BJ,dN_FE_BJ,~,~,~,~,~,~,N_FE_BJ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_3\dt_grw = 1.03','PlotFile',0,100);
 
 [t_FE_CJ,dt_FE_CJ,dN_FE_CJ,~,~,~,~,~,~,N_FE_CJ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_3\dt_grw = 1.07','PlotFile',0,100);
 
 [t_FE_DJ,dt_FE_DJ,dN_FE_DJ,~,~,~,~,~,~,N_FE_DJ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_3\dt_grw = 1.10','PlotFile',0,100);
 
 [t_FE_EJ,dt_FE_EJ,dN_FE_EJ,~,~,~,~,~,~,N_FE_EJ]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_3\dt_grw = 1.10','PlotFile',0,100);
 
 
 
% [t_FE_AK,dt_FE_AK,dN_FE_AK,~,~,~,~,~,~,N_FE_AK]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_4\dt_grw = 1.01','PlotFile',0,95);
% 
% [t_FE_BK,dt_FE_BK,dN_FE_BK,~,~,~,~,~,~,N_FE_BK]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_4\dt_grw = 1.03','PlotFile',0,100);
% 
% [t_FE_CK,dt_FE_CK,dN_FE_CK,~,~,~,~,~,~,N_FE_CK]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_4\dt_grw = 1.07','PlotFile',0,100);
% 
% [t_FE_DK,dt_FE_DK,dN_FE_DK,~,~,~,~,~,~,N_FE_DK]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_4\dt_grw = 1.10','PlotFile',0,100);
% 
% [t_FE_EK,dt_FE_EK,dN_FE_EK,~,~,~,~,~,~,N_FE_EK]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_4\dt_grw = 1.10','PlotFile',0,100);
 
 
 
 [t_FE_AL,dt_FE_AL,dN_FE_AL,~,~,~,~,~,~,N_FE_AL]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_5\dt_grw = 1.01','PlotFile',0,95);
 
 [t_FE_BL,dt_FE_BL,dN_FE_BL,~,~,~,~,~,~,N_FE_BL]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_5\dt_grw = 1.03','PlotFile',0,100);
 
 [t_FE_CL,dt_FE_CL,dN_FE_CL,~,~,~,~,~,~,N_FE_CL]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_5\dt_grw = 1.07','PlotFile',0,100);
 
 [t_FE_DL,dt_FE_DL,dN_FE_DL,~,~,~,~,~,~,N_FE_DL]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_5\dt_grw = 1.10','PlotFile',0,100);
 
 [t_FE_EL,dt_FE_EL,dN_FE_EL,~,~,~,~,~,~,N_FE_EL]=GetTrace_Plotfile('C:\Users\adamh\Documents\MATLAB\Data\FE\Model_5\dt_grw = 1.10','PlotFile',0,100);



loglog(t_1AH_QSS2,dt_1AH_QSS2, '-b'); hold on
loglog(t_2AH_QSS2,dt_2AH_QSS2, '-b');
loglog(t_3AH_QSS2,dt_3AH_QSS2, '-b');
loglog(t_4AH_QSS2,dt_4AH_QSS2, '-b');
loglog(t_5AH_QSS2,dt_5AH_QSS2, '-b');
loglog(t_6AH_QSS2,dt_6AH_QSS2, '-b');
loglog(t_7AH_QSS2,dt_7AH_QSS2, '-b');
loglog(t_8AH_QSS2,dt_8AH_QSS2, '-b');
loglog(t_9AH_QSS2,dt_9AH_QSS2, '-b');

loglog(t_1BH_QSS2,dt_1BH_QSS2, '-b');
loglog(t_2BH_QSS2,dt_2BH_QSS2, '-b');
loglog(t_3BH_QSS2,dt_3BH_QSS2, '-b');
loglog(t_4BH_QSS2,dt_4BH_QSS2, '-b');
loglog(t_5BH_QSS2,dt_5BH_QSS2, '-b');
loglog(t_6BH_QSS2,dt_6BH_QSS2, '-b');
loglog(t_7BH_QSS2,dt_7BH_QSS2, '-b');
loglog(t_8BH_QSS2,dt_8BH_QSS2, '-b');
loglog(t_9BH_QSS2,dt_9BH_QSS2, '-b');

loglog(t_1CH_QSS2,dt_1CH_QSS2, '-b'); 
loglog(t_2CH_QSS2,dt_2CH_QSS2, '-b');
loglog(t_3CH_QSS2,dt_3CH_QSS2, '-b');
loglog(t_4CH_QSS2,dt_4CH_QSS2, '-b');
loglog(t_5CH_QSS2,dt_5CH_QSS2, '-b');
loglog(t_6CH_QSS2,dt_6CH_QSS2, '-b');
loglog(t_7CH_QSS2,dt_7CH_QSS2, '-b');
loglog(t_8CH_QSS2,dt_8CH_QSS2, '-b');
loglog(t_9CH_QSS2,dt_9CH_QSS2, '-b');

loglog(t_1DH_QSS2,dt_1DH_QSS2, '-b'); 
loglog(t_2DH_QSS2,dt_2DH_QSS2, '-b');
loglog(t_3DH_QSS2,dt_3DH_QSS2, '-b');
loglog(t_4DH_QSS2,dt_4DH_QSS2, '-b');
loglog(t_5DH_QSS2,dt_5DH_QSS2, '-b');
loglog(t_6DH_QSS2,dt_6DH_QSS2, '-b');
loglog(t_7DH_QSS2,dt_7DH_QSS2, '-b');
loglog(t_8DH_QSS2,dt_8DH_QSS2, '-b');
loglog(t_9DH_QSS2,dt_9DH_QSS2, '-b');

loglog(t_1EH_QSS2,dt_1EH_QSS2, '-b'); 
loglog(t_2EH_QSS2,dt_2EH_QSS2, '-b');
loglog(t_3EH_QSS2,dt_3EH_QSS2, '-b');
loglog(t_4EH_QSS2,dt_4EH_QSS2, '-b');
loglog(t_5EH_QSS2,dt_5EH_QSS2, '-b');
loglog(t_6EH_QSS2,dt_6EH_QSS2, '-b');
loglog(t_7EH_QSS2,dt_7EH_QSS2, '-b');
loglog(t_8EH_QSS2,dt_8EH_QSS2, '-b');
loglog(t_9EH_QSS2,dt_9EH_QSS2, '-b');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

loglog(t_1AI_QSS2,dt_1AI_QSS2, '-m');
loglog(t_2AI_QSS2,dt_2AI_QSS2, '-m');
loglog(t_3AI_QSS2,dt_3AI_QSS2, '-m');
loglog(t_4AI_QSS2,dt_4AI_QSS2, '-m');
loglog(t_5AI_QSS2,dt_5AI_QSS2, '-m');
loglog(t_6AI_QSS2,dt_6AI_QSS2, '-m');
loglog(t_7AI_QSS2,dt_7AI_QSS2, '-m');
loglog(t_8AI_QSS2,dt_8AI_QSS2, '-m');
loglog(t_9AI_QSS2,dt_9AI_QSS2, '-m');

loglog(t_1BI_QSS2,dt_1BI_QSS2, '-m');
loglog(t_2BI_QSS2,dt_2BI_QSS2, '-m');
loglog(t_3BI_QSS2,dt_3BI_QSS2, '-m');
loglog(t_4BI_QSS2,dt_4BI_QSS2, '-m');
loglog(t_5BI_QSS2,dt_5BI_QSS2, '-m');
loglog(t_6BI_QSS2,dt_6BI_QSS2, '-m');
loglog(t_7BI_QSS2,dt_7BI_QSS2, '-m');
loglog(t_8BI_QSS2,dt_8BI_QSS2, '-m');
loglog(t_9BI_QSS2,dt_9BI_QSS2, '-m');

loglog(t_1CI_QSS2,dt_1CI_QSS2, '-m'); 
loglog(t_2CI_QSS2,dt_2CI_QSS2, '-m');
loglog(t_3CI_QSS2,dt_3CI_QSS2, '-m');
loglog(t_4CI_QSS2,dt_4CI_QSS2, '-m');
loglog(t_5CI_QSS2,dt_5CI_QSS2, '-m');
loglog(t_6CI_QSS2,dt_6CI_QSS2, '-m');
loglog(t_7CI_QSS2,dt_7CI_QSS2, '-m');
loglog(t_8CI_QSS2,dt_8CI_QSS2, '-m');
loglog(t_9CI_QSS2,dt_9CI_QSS2, '-m');

loglog(t_1DI_QSS2,dt_1DI_QSS2, '-m'); 
loglog(t_2DI_QSS2,dt_2DI_QSS2, '-m');
loglog(t_3DI_QSS2,dt_3DI_QSS2, '-m');
loglog(t_4DI_QSS2,dt_4DI_QSS2, '-m');
loglog(t_5DI_QSS2,dt_5DI_QSS2, '-m');
loglog(t_6DI_QSS2,dt_6DI_QSS2, '-m');
loglog(t_7DI_QSS2,dt_7DI_QSS2, '-m');
loglog(t_8DI_QSS2,dt_8DI_QSS2, '-m');
loglog(t_9DI_QSS2,dt_9DI_QSS2, '-m');

loglog(t_1EI_QSS2,dt_1EI_QSS2, '-m'); 
loglog(t_2EI_QSS2,dt_2EI_QSS2, '-m');
loglog(t_3EI_QSS2,dt_3EI_QSS2, '-m');
loglog(t_4EI_QSS2,dt_4EI_QSS2, '-m');
loglog(t_5EI_QSS2,dt_5EI_QSS2, '-m');
loglog(t_6EI_QSS2,dt_6EI_QSS2, '-m');
loglog(t_7EI_QSS2,dt_7EI_QSS2, '-m');
loglog(t_8EI_QSS2,dt_8EI_QSS2, '-m');
loglog(t_9EI_QSS2,dt_9EI_QSS2, '-m');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

loglog(t_1AJ_QSS2,dt_1AJ_QSS2, '-g');
loglog(t_2AJ_QSS2,dt_2AJ_QSS2, '-g');
loglog(t_3AJ_QSS2,dt_3AJ_QSS2, '-g');
loglog(t_4AJ_QSS2,dt_4AJ_QSS2, '-g');
loglog(t_5AJ_QSS2,dt_5AJ_QSS2, '-g');
loglog(t_6AJ_QSS2,dt_6AJ_QSS2, '-g');
loglog(t_7AJ_QSS2,dt_7AJ_QSS2, '-g');
loglog(t_8AJ_QSS2,dt_8AJ_QSS2, '-g');
loglog(t_9AJ_QSS2,dt_9AJ_QSS2, '-g');

loglog(t_1BJ_QSS2,dt_1BJ_QSS2, '-g');
loglog(t_2BJ_QSS2,dt_2BJ_QSS2, '-g');
loglog(t_3BJ_QSS2,dt_3BJ_QSS2, '-g');
loglog(t_4BJ_QSS2,dt_4BJ_QSS2, '-g');
loglog(t_5BJ_QSS2,dt_5BJ_QSS2, '-g');
loglog(t_6BJ_QSS2,dt_6BJ_QSS2, '-g');
loglog(t_7BJ_QSS2,dt_7BJ_QSS2, '-g');
loglog(t_8BJ_QSS2,dt_8BJ_QSS2, '-g');
loglog(t_9BJ_QSS2,dt_9BJ_QSS2, '-g');

loglog(t_1CJ_QSS2,dt_1CJ_QSS2, '-g'); 
loglog(t_2CJ_QSS2,dt_2CJ_QSS2, '-g');
loglog(t_3CJ_QSS2,dt_3CJ_QSS2, '-g');
loglog(t_4CJ_QSS2,dt_4CJ_QSS2, '-g');
loglog(t_5CJ_QSS2,dt_5CJ_QSS2, '-g');
loglog(t_6CJ_QSS2,dt_6CJ_QSS2, '-g');
loglog(t_7CJ_QSS2,dt_7CJ_QSS2, '-g');
loglog(t_8CJ_QSS2,dt_8CJ_QSS2, '-g');
loglog(t_9CJ_QSS2,dt_9CJ_QSS2, '-g');

loglog(t_1DJ_QSS2,dt_1DJ_QSS2, '-g'); 
loglog(t_2DJ_QSS2,dt_2DJ_QSS2, '-g');
loglog(t_3DJ_QSS2,dt_3DJ_QSS2, '-g');
loglog(t_4DJ_QSS2,dt_4DJ_QSS2, '-g');
loglog(t_5DJ_QSS2,dt_5DJ_QSS2, '-g');
loglog(t_6DJ_QSS2,dt_6DJ_QSS2, '-g');
loglog(t_7DJ_QSS2,dt_7DJ_QSS2, '-g');
loglog(t_8DJ_QSS2,dt_8DJ_QSS2, '-g');
loglog(t_9DJ_QSS2,dt_9DJ_QSS2, '-g');


loglog(t_1EJ_QSS2,dt_1EJ_QSS2, '-g'); 
loglog(t_2EJ_QSS2,dt_2EJ_QSS2, '-g');
loglog(t_3EJ_QSS2,dt_3EJ_QSS2, '-g');
loglog(t_4EJ_QSS2,dt_4EJ_QSS2, '-g');
loglog(t_5EJ_QSS2,dt_5EJ_QSS2, '-g');
loglog(t_6EJ_QSS2,dt_6EJ_QSS2, '-g');
loglog(t_7EJ_QSS2,dt_7EJ_QSS2, '-g');
loglog(t_8EJ_QSS2,dt_8EJ_QSS2, '-g');
loglog(t_9EJ_QSS2,dt_9EJ_QSS2, '-g');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

loglog(t_1AK_QSS2,dt_1AK_QSS2, '-y');
loglog(t_2AK_QSS2,dt_2AK_QSS2, '-y');
loglog(t_3AK_QSS2,dt_3AK_QSS2, '-y');
loglog(t_4AK_QSS2,dt_4AK_QSS2, '-y');
loglog(t_5AK_QSS2,dt_5AK_QSS2, '-y');
loglog(t_6AK_QSS2,dt_6AK_QSS2, '-y');
loglog(t_7AK_QSS2,dt_7AK_QSS2, '-y');
loglog(t_8AK_QSS2,dt_8AK_QSS2, '-y');
loglog(t_9AK_QSS2,dt_9AK_QSS2, '-y');

loglog(t_1BK_QSS2,dt_1BK_QSS2, '-y');
loglog(t_2BK_QSS2,dt_2BK_QSS2, '-y');
loglog(t_3BK_QSS2,dt_3BK_QSS2, '-y');
loglog(t_4BK_QSS2,dt_4BK_QSS2, '-y');
loglog(t_5BK_QSS2,dt_5BK_QSS2, '-y');
loglog(t_6BK_QSS2,dt_6BK_QSS2, '-y');
loglog(t_7BK_QSS2,dt_7BK_QSS2, '-y');
loglog(t_8BK_QSS2,dt_8BK_QSS2, '-y');
loglog(t_9BK_QSS2,dt_9BK_QSS2, '-y');

loglog(t_1CK_QSS2,dt_1CK_QSS2, '-y'); 
loglog(t_2CK_QSS2,dt_2CK_QSS2, '-y');
loglog(t_3CK_QSS2,dt_3CK_QSS2, '-y');
loglog(t_4CK_QSS2,dt_4CK_QSS2, '-y');
loglog(t_5CK_QSS2,dt_5CK_QSS2, '-y');
loglog(t_6CK_QSS2,dt_6CK_QSS2, '-y');
loglog(t_7CK_QSS2,dt_7CK_QSS2, '-y');
loglog(t_8CK_QSS2,dt_8CK_QSS2, '-y');
loglog(t_9CK_QSS2,dt_9CK_QSS2, '-y');

loglog(t_1DK_QSS2,dt_1DK_QSS2, '-y'); 
loglog(t_2DK_QSS2,dt_2DK_QSS2, '-y');
loglog(t_3DK_QSS2,dt_3DK_QSS2, '-y');
loglog(t_4DK_QSS2,dt_4DK_QSS2, '-y');
loglog(t_5DK_QSS2,dt_5DK_QSS2, '-y');
loglog(t_6DK_QSS2,dt_6DK_QSS2, '-y');
loglog(t_7DK_QSS2,dt_7DK_QSS2, '-y');
loglog(t_8DK_QSS2,dt_8DK_QSS2, '-y');
loglog(t_9DK_QSS2,dt_9DK_QSS2, '-y');


loglog(t_1EK_QSS2,dt_1EK_QSS2, '-y'); 
loglog(t_2EK_QSS2,dt_2EK_QSS2, '-y');
loglog(t_3EK_QSS2,dt_3EK_QSS2, '-y');
loglog(t_4EK_QSS2,dt_4EK_QSS2, '-y');
loglog(t_5EK_QSS2,dt_5EK_QSS2, '-y');
loglog(t_6EK_QSS2,dt_6EK_QSS2, '-y');
loglog(t_7EK_QSS2,dt_7EK_QSS2, '-y');
loglog(t_8EK_QSS2,dt_8EK_QSS2, '-y');
loglog(t_9EK_QSS2,dt_9EK_QSS2, '-y');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

loglog(t_1AL_QSS2,dt_1AL_QSS2, '-r');
loglog(t_2AL_QSS2,dt_2AL_QSS2, '-r');
loglog(t_3AL_QSS2,dt_3AL_QSS2, '-r');
loglog(t_4AL_QSS2,dt_4AL_QSS2, '-r');
loglog(t_5AL_QSS2,dt_5AL_QSS2, '-r');
loglog(t_6AL_QSS2,dt_6AL_QSS2, '-r');
loglog(t_7AL_QSS2,dt_7AL_QSS2, '-r');
loglog(t_8AL_QSS2,dt_8AL_QSS2, '-r');
loglog(t_9AL_QSS2,dt_9AL_QSS2, '-r');

loglog(t_1BL_QSS2,dt_1BL_QSS2, '-r');
loglog(t_2BL_QSS2,dt_2BL_QSS2, '-r');
loglog(t_3BL_QSS2,dt_3BL_QSS2, '-r');
loglog(t_4BL_QSS2,dt_4BL_QSS2, '-r');
loglog(t_5BL_QSS2,dt_5BL_QSS2, '-r');
loglog(t_6BL_QSS2,dt_6BL_QSS2, '-r');
loglog(t_7BL_QSS2,dt_7BL_QSS2, '-r');
loglog(t_8BL_QSS2,dt_8BL_QSS2, '-r');
loglog(t_9BL_QSS2,dt_9BL_QSS2, '-r');

loglog(t_1CL_QSS2,dt_1CL_QSS2, '-r'); 
loglog(t_2CL_QSS2,dt_2CL_QSS2, '-r');
loglog(t_3CL_QSS2,dt_3CL_QSS2, '-r');
loglog(t_4CL_QSS2,dt_4CL_QSS2, '-r');
loglog(t_5CL_QSS2,dt_5CL_QSS2, '-r');
loglog(t_6CL_QSS2,dt_6CL_QSS2, '-r');
loglog(t_7CL_QSS2,dt_7CL_QSS2, '-r');
loglog(t_8CL_QSS2,dt_8CL_QSS2, '-r');
loglog(t_9CL_QSS2,dt_9CL_QSS2, '-r');

loglog(t_1DL_QSS2,dt_1DL_QSS2, '-r'); 
loglog(t_2DL_QSS2,dt_2DL_QSS2, '-r');
loglog(t_3DL_QSS2,dt_3DL_QSS2, '-r');
loglog(t_4DL_QSS2,dt_4DL_QSS2, '-r');
loglog(t_5DL_QSS2,dt_5DL_QSS2, '-r');
loglog(t_6DL_QSS2,dt_6DL_QSS2, '-r');
loglog(t_7DL_QSS2,dt_7DL_QSS2, '-r');
loglog(t_8DL_QSS2,dt_8DL_QSS2, '-r');
loglog(t_9DL_QSS2,dt_9DL_QSS2, '-r');


loglog(t_1EL_QSS2,dt_1EL_QSS2, '-r'); 
loglog(t_2EL_QSS2,dt_2EL_QSS2, '-r');
loglog(t_3EL_QSS2,dt_3EL_QSS2, '-r');
loglog(t_4EL_QSS2,dt_4EL_QSS2, '-r');
loglog(t_5EL_QSS2,dt_5EL_QSS2, '-r');
loglog(t_6EL_QSS2,dt_6EL_QSS2, '-r');
loglog(t_7EL_QSS2,dt_7EL_QSS2, '-r');
loglog(t_8EL_QSS2,dt_8EL_QSS2, '-r');
loglog(t_9EL_QSS2,dt_9EL_QSS2, '-r');