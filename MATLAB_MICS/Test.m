clear all;
close all;

%addpath( '/MATLAB Drive/collisionator/Source' );
addpath( 'C:\Users\adamh\Documents\GitHub\Collisionator\Run' );
addpath( 'C:\Users\adamh\Documents\GitHub\Collisionator\Data' );
addpath( 'C:\Users\adamh\Documents\GitHub\Collisionator\Source' );
addpath( 'C:\Users\adamh\Documents\GitHub\NeutrinoTransportTesting\Data');
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
%
%PlotFile_00000000
%Data = load( [ FileDir '/' FileName '_' num2str( i, '%08d' ) ] );
%****************************

%[At1_C,Adt1_C,AN1_C,~,~,~,TCA1_C,AdN1_C]=GetTrace_Plotfile(...
%'C:\Users\adamh\Documents\GitHub\NeutrinoTransportTesting\Data','PlotFile',0,240);

fileID = fopen('TimeStepLog2.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
m = size(A);
n = m(1);
b = zeros(n);

for i = 1:m(1)
    b(i) = mod(i, 2);
    
end

figure; hold on;
loglog(At1_C, Adt1_C, '-k');
%loglog(At1_C, AN1_C(20), '-k');

%xlim([10^(-14) 10^(-2)])
%ylim([10^(-1) 10^(-2)])
xlim auto
ylim auto

title('Timestep test')

xlabel('Time')
ylabel('Size of Time-Step')

%figure;
%loglog(At1_C, AN1_C(20), '-k');

