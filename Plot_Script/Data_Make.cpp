using namespace std;
#include <iostream>
#include <cmath>
#include <string>
#include <vector>
#include <gnuplot-iostream.h>
#include "../Source/GetTrace_Plotfile2.h"

int main() {

string FileDir = "/home/jared/NeutrinoTransport/Plot_Script/Bin";
string FileName = "PlotFile_";
string FileDir2 = "/home/jared/NeutrinoTransport/Plot_Script/Benchmarks/B2";

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
