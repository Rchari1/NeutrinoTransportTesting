close all
clear all

addpath( '/home/jared/Collisionator/Source' );
addpath( '/home/jared/NeutrinoTransportTesting/MATLAB_MICS/Translated');
addpath( '/home/jared/Collisionator/Run/Output');

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

numPlotfile = 150;
RG = 40;
FileDir    = '/home/jared/NeutrinoTransportTesting/MATLAB_MICS/Translated';
plotFileName   = 'PlotFile';

[tVec, dtVec, DNVec, kVec, cMat, cycleVec, truecycleVec, nIterationsVec,...
    nTrueIterationsVec, NMat, eC, Branch, dt_FE, dt_EA, dt_PE]...
        =GetTrace_Plotfile('/home/jared/Collisionator/Run/Output','PlotFile',0,numPlotfile);

for i = 1:numPlotfile

    FileName = [ FileDir '/' plotFileName '_' num2str( i, '%d' ) ];

    fileID = fopen(FileName,'w');
    fprintf(fileID,'t\r\n');
    fprintf(fileID,'%25.25f\r\n',tVec(i));
    
    fprintf(fileID,'dt\r\n');
    fprintf(fileID,'%25.25f\r\n',dtVec(i));
    
    fprintf(fileID,'DN\r\n');
    fprintf(fileID,'%25.25f\r\n',DNVec(i));
    
    fprintf(fileID,'TC\r\n');
    fprintf(fileID,'%6.4f\r\n',truecycleVec(i));
    
    fprintf(fileID,'N\r\n');
    fprintf(fileID,'%12.8s\r\n', NMat(i,:));
    
    fprintf(fileID,'eC\r\n');
    fprintf(fileID,'%12.8s\r\n', eC(i,:));
    
    %fprintf(fileID,'CMat\r\n');
    %for j = 1:RG
        %fprintf(fileID,'%8.8s %d\r\n','// RG = ',j );
        %fprintf(fileID,'%12.8s\r\n', cMat(i,j,:));
    %end
    
    fclose(fileID);

end