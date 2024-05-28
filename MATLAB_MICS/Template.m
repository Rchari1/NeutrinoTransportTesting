close all;
clear all;

%first tell the computer where the sourse file is on your computer
addpath( '..\Collisionator\Source' );

%GetTrace_Plotfile reades in 100 values from the data file specifyed at
%location and puts them into the array named on the left. the '~' indicates
%an entry that will not be used. 

[t_FE,dt_FE,dN_FE,~,~,~,~,~,~,N_FE]=GetTrace_Plotfile('[path to forward euler data file]','PlotFile',0,100); %replace what is in the brackets with the path to file

[t_1, dt_1, dN_1,~,~,~, TC_1,~,~,N_1 ]=GetTrace_Plotfile('[path to data file 1]','PlotFile',0,100);

%[t_2, dt_2, dN_2,~,~,~, TC_2,~,~,N_2 ]=GetTrace_Plotfile('[path to data file 2]','PlotFile',0,100);

%[t_3, dt_3, dN_3,~,~,~, TC_3,~,~,N_3 ]=GetTrace_Plotfile('[path to data file 3]','PlotFile',0,100);

%make dt vs t graph
loglog(t_FE,dt_FE, '-r'); hold on
loglog(t_1,dt_1, '-b');
%loglog(t_1,dt_1, '-g');
%loglog(t_1,dt_1, '-m');
