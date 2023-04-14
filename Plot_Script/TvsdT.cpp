using namespace std;
#include <iostream>
#include <cmath>
#include <string>
#include <vector>
#include <gnuplot-iostream.h>
#include "../NeutrinoTransport/Source/GetTrace_Plotfile2.h"

int main() {

string FileDir = "/home/jared/NeutrinoTransportTesting/Plot_Script/Bin";
string FileName = "PlotFile_";
string FileDir2 = "/home/jared/NeutrinoTransportTesting/Plot_Script/Benchmarks/B2";

int Lo = 0;
int Hi = 98;
std::tuple<vector<double>, vector<double>, vector<vector<double>>, vector<vector<double>>, vector<vector < double >> >
 BFM = GetTrace_Plotfile2(FileDir, FileName, Lo, Hi);
//vector<vector<vector<double>>>

vector<double> t1  = get<0>(BFM);
vector<double> dt1 = get<1>(BFM);
vector<vector<double>> N1 = get<2>(BFM);
vector<vector<double>> eC1 = get<3>(BFM);
vector<vector<double>> dv1 = get<4>(BFM);
//vector<vector<vector<double>>> cMat1 = get<5>(BFM);

std::tuple<vector<double>, vector<double>, vector<vector<double>>, vector<vector<double>>, vector<vector < double >> >
 BFM2 = GetTrace_Plotfile2(FileDir2, FileName, Lo+1, Hi+1);
//vector<vector<vector<double>>>

vector<double> t2  = get<0>(BFM2);
vector<double> dt2 = get<1>(BFM2);
vector<vector<double>> N2 = get<2>(BFM2);
vector<vector<double>> eC2 = get<3>(BFM2);
vector<vector<double>> dv2 = get<4>(BFM2);
//vector<vector<vector<double>>> cMat2 = get<5>(BFM2);

    /*

    // Open a pipe to gnuplot
        FILE *gnuplotPipe = popen("gnuplot -persistent", "w");

    // Set plot properties
    fprintf(gnuplotPipe, "set title 't1 vs dt1 (log-log, lines)'\n");
    fprintf(gnuplotPipe, "set xlabel 't1'\n");
    fprintf(gnuplotPipe, "set ylabel 'dt1'\n");
    fprintf(gnuplotPipe, "set logscale xy\n"); // Set x and y axes to logarithmic scales
    fprintf(gnuplotPipe, "set format x '%T'\n"); // Format x axis labels in scientific notation
    fprintf(gnuplotPipe, "set format y '%T'\n"); // Format y axis labels in scientific notation
    fprintf(gnuplotPipe, "set style line 1 lc rgb 'black' lw 2\n"); // Set line color to black and line width to 2
    fprintf(gnuplotPipe, "set style line 2 lc rgb 'red' lw 2\n"); // Set line color to red and line width to 2

    // Plot the data
    fprintf(gnuplotPipe, "plot '-' with lines ls 2 title 'Line 2', '-' with lines ls 1 title 'Line 1'\n");
    for(int i=0; i<100; i++)
    {
        fprintf(gnuplotPipe, "%lf %lf\n", t2[i], dt2[i]); // Plot line 2
    }
    fprintf(gnuplotPipe, "e\n"); // End of line 2 data
    for(int i=0; i<100; i++)
    {
        fprintf(gnuplotPipe, "%lf %lf\n", t1[i], dt1[i]); // Plot line 1
    }
    fprintf(gnuplotPipe, "e\n"); // End of line 1 data

    // Close the pipe
    pclose(gnuplotPipe);
    */



    FILE *gnuplotPipe = popen("gnuplot -persistent", "w");

        // Set plot properties
    fprintf(gnuplotPipe, "set title 'N vs T (lines)'\n");
    fprintf(gnuplotPipe, "set logscale xy\n"); // Set x and y axes to logarithmic scales
    fprintf(gnuplotPipe, "set xlabel 'T'\n");
    fprintf(gnuplotPipe, "set ylabel 'N'\n");
    fprintf(gnuplotPipe, "set key outside\n"); // Move legend outside of plot

    // Plot the data
    for(int i=0; i<40; i++)
    {
        fprintf(gnuplotPipe, "plot '-' with lines title 'Line %d'\n", i+1);
        for(int j=0; j<100; j++)
        {
            fprintf(gnuplotPipe, "%lf %lf\n", t1[j], N1[i][j]);
        }
        fprintf(gnuplotPipe, "e\n"); // End of data for current line
        fprintf(gnuplotPipe, "pause 0.5\n"); // Pause to display plot
    }

    // Close the pipe
    pclose(gnuplotPipe);

//In this example code, we have created a 2D vector N1 with 40 rows (one for each line) and 100 columns (


return 0;
}
