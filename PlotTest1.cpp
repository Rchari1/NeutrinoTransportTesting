#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
#include <cstdlib>using namespace std;// gnuplot commands
#define GNUPLOT "gnuplot -persist"
#define GP_CMD "plot "// Data struct to hold the data for each plot file

struct PlotData {
    vector<double> t;   // Time values
    vector<double> dt;  // dt values
    string filename;    // Filename

};int main() {
    // Vector to hold the plot data for all files
    vector<PlotData> plotDataVec;    // Loop through all plot files
    for (int i = 1; i <= 99; ++i) {
        stringstream ss;
        ss << "Output/PlotFile_" << i << ".txt";
        string filename = ss.str();        // Open the file
        ifstream fin(filename.c_str());
        if (!fin.is_open()) {
            cerr << "Failed to open " << filename << endl;
            continue;
        }        // Read the data
        PlotData plotData;
        plotData.filename = filename;
        string line;
        getline(fin, line); // skip the first line
        while (getline(fin, line)) {
            istringstream iss(line);
            double t, dt, dN;
            iss >> t >> dt >> dN;
            plotData.t.push_back(t);
            plotData.dt.push_back(dt);
        }        // Add the plot data to the vector
        plotDataVec.push_back(plotData);        // Close the file
        fin.close();
    }    // Plot the data for all files
    stringstream ss;
    ss << GP_CMD;
    for (size_t i = 0; i < plotDataVec.size(); ++i) {
        ss << "\"" << plotDataVec[i].filename << "\" using 1:2 with lines title \"" << plotDataVec[i].filename << "\", ";
    }
    string cmd = ss.str();
    cmd = cmd.substr(0, cmd.size() - 2); // remove the last comma and space    // Use gnuplot to plot the data
    FILE *gp = popen(GNUPLOT, "w");
    if (gp == NULL) {
        cerr << "Failed to open gnuplot" << endl;
        return EXIT_FAILURE;
    }
    fprintf(gp, "%s\n", cmd.c_str());
    fflush(gp);    // Wait for user input before closing the gnuplot window
    cout << "Press Enter to exit" << endl;
    getchar();    // Close gnuplot
    pclose(gp);    return EXIT_SUCCESS;
}
