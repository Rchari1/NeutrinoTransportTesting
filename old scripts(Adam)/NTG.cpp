#include <iostream>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include "Source/Logfile.h"
#include "Source/InitializeNES.h"
#include "Source/RestartCalculation.h"
#include "Source/BuildCollisionMatrix_NES.h"
#include "Source/Write_Plotfile.h"
#include "Source/ComputeRates.h"
#include "Source/NewtonRaphson.h"
#include "Source/JAC_FD.h"
#include "Source/RHS_FD.h"
//#include "Data.h"

using namespace std;

int main() {
    // --- Computational Parameters ----------------------------
    string Model = "001"; // --- Determines Local Thermodynamic Conditions
    int N_g = 40;    // --- Number of Energy Groups (Must be 40)
    double t_end = 1.0e-02; // [ s ] Final time
    double t = 1.0e-15; // [ s ] Initial time
    double t_W0 = 1.0e-10; // [ s ] Initial write time
    double dt_min = 1.0e-16; // [ s ] Minimum time step
    double dt_max = 1.0e-01; // [ s ] Maximum time step
    double dt = 1.0e-15; // [ s ] Initial time step
    double dt_grw = 1.003;    // Max dt growth per time step
    double dt_dec = 0.90;    // Decline factor for dt if restep
    double dt_FE = dt, dt_EA = dt, dt_PE = dt;
    int reStart = 0;       // For restarting run at a specific data file
    double G_A = 7.5e-01;    // Gaussian Amplitude
    double G_B = 1.0e+02;    // Gaussian Expected Value
    double G_C = sqrt(50.0); // Gaussian Width
    int cycleM = (int)1e9;    // Maximum Cycles
    int cycleD = 100;     // Display Interval
    int cycleW = 10;      // Write Interval
    double tolPE = 1.0e-01;  // Partial Equilibrium Tolerance
    double tolC = 1.0e-09;  // Particle Conservation Tolerance
    double tolBE = 1.0e-08;  // Convergence Tolerance For Backward Euler
    double tolN = 1.0e-02;  // Relative Density Tolerance For Methods 
    int FE    = 0;
    int EA    = 1;
    int FE_PE = 2;
    int EA_C  = 3;
    int QSS1  = 4;
    int QSS2  = 5;
    int BE    = 6;
    int FP    = 7;
    int QSS3  = 8;
    int AFP   = 9;
    string Scheme = "ExplicitAsymptotic";
    string Comment = "";
    string PlotFileDir = "./Output";
    string PlotFileName = "PlotFile";
    int PlotFileNumber = 0;
    string RestartDir = "./Output";
    string RestartFileName = "PlotFile";
    int RestartFileNumber = 0;
    int nPlotFiles = 100; 
    // --- Logs Important Parameters Into A File ---
    Logfile(t_end, t, t_W0, dt, G_A, G_B, G_C, tolC, Scheme, Comment); 

    // Initalizes 
    std::vector<double> eC(N_g), dV(N_g), N_Eq(N_g);
    std::vector<std::vector<double>> R_In(N_g), R_Out(N_g);

    InitializeNES(Model, N_g, eC, dV, R_In, R_Out, N_Eq);


     // Multiply Rates with Momentum Space Volume Element
    vector<vector<double>> R_In_H(N_g);
    vector<vector<double>> R_Out_H(N_g);
    for (int i = 0; i < N_g; i++) {
        R_In_H[i].resize(N_g);
        R_Out_H[i].resize(N_g);
        for (int j = 0; j < N_g; j++) {
            R_In_H[i][j] = R_In[i][j] * dV[i];
            R_Out_H[i][j] = R_Out[i][j] * dV[i];
        }
    }
        vector<double> N_0(N_g);
    if (reStart == 1) 
    {
       
        // Set Initial Density
    vector<double> N_0(N_g);
    if (reStart == 1) {
        N_0 = RestartCalculation(RestartDir, RestartFileName, RestartFileNumber);
    } else {
        for (int i = 0; i < N_g; i++) {
            N_0[i] = G_A * exp(-0.5 * pow((eC[i] - G_B) / G_C, 2));
        }
    }
    vector<double> Nold = N_0;
    vector<vector<double>> cMat(N_g);
    vector<double> kVec(N_g);
    BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0, cMat, kVec);

    bool done = false;
    bool reStep = false;
    int cycle = 0;
    int true_cycle = 0;
    int nIterations = 0;
    int nTrueIterations = 0;
    int maxFPIterations = 10000; 
    int mAA = 3;
    // --- Write Initial Condition ---
    PlotFileNumber = Write_Plotfile(t, dt, Nold, eC, dV, kVec, cMat, 0, 0, 0, 0, PlotFileDir, PlotFileName, PlotFileNumber);

        // --- Main Time Loop ---
    while (!done) {
        // --- Check for Maximum Cycles ---
        if (true_cycle >= cycleM) {
            cout << "Maximum Number of Cycles Exceeded. Exiting Program." << endl;
            done = true;
            break;
        }
        // ---- Main Loop ----
    while (!done) {
        //initialize Nold and Nnew with appropriate values
        std::vector<double> Nold(N_g), Nnew(N_g);
        if (Scheme == "ExplicitAsymptotic") {
            int Branch = EA;
            std::pair<std::vector<std::vector<double>>, std::vector<double>> cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0, cMat, kVec);
            std::vector<std::vector<double>> cMat = cMat_kVec.first;
            std::vector<double> kVec = cMat_kVec.second;
            double dt_FE = *std::min_element(kVec.begin(), kVec.end());
            if (reStep) {
                dt = dt_dec * dt;
                reStep = false;
            }
            else {
                dt = dt_grw * dt;
            }

            if (dt <= dt_FE) {
                Nnew = Nold;
            for (int i = 0; i < N_g; i++) {
                for (int j = 0; j < N_g; j++) {
                    Nnew[i] += dt * cMat[i][j] * Nold[j];
            }
        }
    }
            else {
                Nnew = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        Nnew[i] += (dt / (1 + kVec[i] * dt)) * cMat[i][j] * Nold[j];
                }
            }
                double sum_Nnew_dV = 0, sum_Nold_dV = 0;
                for (int i = 0; i < N_g; i++) {
                    sum_Nnew_dV += Nnew[i] * dV[i];
                    sum_Nold_dV += Nold[i] * dV[i];
            }
            if (abs(sum_Nnew_dV - sum_Nold_dV) / sum_Nold_dV > tolC) {
                reStep = true;
            }
            double max_rel_diff = 0;
            for (int i = 0; i < N_g; i++) {
                max_rel_diff = max(max_rel_diff, abs(Nnew[i] - Nold[i]) / max(Nold[i], 1e-8));
         }
            if (max_rel_diff > tolN) {
                reStep = true;
            }
        }
    }

        
        else if (Scheme == "FE_PE") {
            int Branch = FE_PE;
            std::pair<std::vector<std::vector<double>>, std::vector<double>> cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, tolPE, cMat, kVec);
            std::vector<std::vector<double>> cMat = cMat_kVec.first;
            std::vector<double> kVec = cMat_kVec.second;
            double dt_PE = *std::min_element(kVec.begin(), kVec.end());
            dt = min(dt_PE, dt_grw * dt);
            Nnew = Nold;
            for (int i = 0; i < N_g; i++) {
                for (int j = 0; j < N_g; j++) {
                    Nnew[i] += dt * cMat[i][j] * Nold[j];
        }
    }
}

        
        else if (Scheme == "QSS1") {
            int Branch = QSS1;

            if( reStep )
            {
                dt = dt_dec * dt;
                reStep = false;
            }
            else
            {
                dt = dt_grw * dt;
            }
            auto cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0, cMat, kVec);
            std::vector<std::vector<double>> cMat = cMat_kVec.first;
            std::vector<double> kVec = cMat_kVec.second;
            dt_FE = *std::min_element(kVec.begin(), kVec.end());
            if(dt <= dt_FE)
            {
                Nnew = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        Nnew[i] += dt * cMat[i][j] * Nold[j];
                    }
                }
                nTrueIterations++;
            }
            else
            {
                std::vector<double> exp_kdt(N_g);
                std::vector<double> k0(N_g);
                auto F0_k0 = ComputeRates(R_In, R_Out, Nold, dV);                
                auto F0 = F0_k0.first;
                auto k0 = F0_k0.second;
                for(int i = 0; i < N_g; i++)
                {
                    exp_kdt[i] = exp(-dt * k0[i]);
                }
                Nnew = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        Nnew[i] += (cMat[i][j] * Nold[j]) * (1.0 - exp_kdt[i]) / k0[i];
                    }
                }
            }
            double sum_Nnew_dV = std::inner_product(Nnew.begin(), Nnew.end(), dV.begin(), 0.0);
            double sum_Nold_dV = std::inner_product(Nold.begin(), Nold.end(), dV.begin(), 0.0);

            if (std::abs((sum_Nnew_dV - sum_Nold_dV) / sum_Nold_dV) > tolC) {
                reStep = true;
            }
            std::vector<double> diff(Nnew.size());
            std::transform(Nnew.begin(), Nnew.end(), Nold.begin(), diff.begin(), [](double a, double b){return std::abs(a-b);});
            double max_diff = *std::max_element(diff.begin(), diff.end());
            if (max_diff / *std::max_element(Nold.begin(), Nold.end()) > tolN) {
                reStep = true;
            }
      
        }
        else if (Scheme == "QSS2") {
            int Branch = QSS2;

            if( reStep )
            {
                dt = dt_dec * dt; 
                reStep = false;
            }
            else {
                dt = dt_grw * dt; 

            }

            auto F0_k0 = ComputeRates(R_In, R_Out, Nold, dV);
            std::vector<double> &F0 = F0_k0.first;
            std::vector<double> &k0 = F0_k0.second;

            dt_FE = *std::min_element(k0.begin(), k0.end());

            if( dt <= dt_FE )
            {
                auto cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0, cMat, kVec);
                Nnew = Nold + dt * (cMat_kVec.first * Nold);
                nTrueIterations = nTrueIterations + 1 ;
                      
            }
            else 
            {
                std::vector<double> r0(N_g);    //r0
                for (int i = 0; i < N_g; i++) {
                    r0[i] = 1.0 / (k0[i] * dt);
                }   
         
                std::vector<double> Alpha0(N_g); //The First Alpha
                for (int i = 0; i < N_g; i++) {
                Alpha0[i] = ((160 * pow(r0[i],3)) + (60 * pow(r0[i],2)) + (11 * r0[i]) + 1)/((360 * pow(r0[i],3)) + (60 * pow(r0[i],2)) + (12 * r0[i]) + 1);
                } 

                std::vector<double> Np(N_g);  // Np
                for (int i = 0; i < N_g; i++) {
                    Np[i] = Nold[i] + dt * (F0[i] - k0[i] * Nold[i]) / (1.0 + (Alpha0[i] * k0[i] * dt));
                }

         
                auto Fp_kp = ComputeRates( R_In, R_Out, Np, dV );
      
                std::vector<double> kp = Fp_kp.second;
                std::vector<double> Fp = Fp_kp.first;

                std::vector<double> kBAR(N_g);
                for (int i = 0; i < N_g; i++) {
                    kBAR[i] = 0.5 * (kp[i] + k0[i]);
                }

                std::vector<double> rBAR(N_g);
                for (int i = 0; i < N_g; i++) {
                    rBAR[i] = 1.0 / (kBAR[i] * dt);
                
                std::vector<double> AlphaBAR(N_g);
                for (int i = 0; i < N_g; i++)
                {
                    AlphaBAR[i] = ((160 * pow(rBAR[i],3)) + (60 * pow(rBAR[i],2)) + (11 * rBAR[i]) + 1) /((360 * pow(rBAR[i],3)) + (60 * pow(rBAR[i],2)) + (12 * rBAR[i]) + 1);
                }
                std::vector<double> Ft(N_g);
                for (int i = 0; i < N_g; i++)
                {
                    Ft[i] = AlphaBAR[i] * Fp[i] + (1.0 - AlphaBAR[i]) * F0[i];
                }
                std::vector<double> Nnew(N_g);
                for (int i = 0; i < N_g; i++)
                {
                    Nnew[i] = Nold[i] + dt * (Ft[i] - kBAR[i] * Nold[i]) / (1.0 + (Alpha0[i] * kBAR[i] * dt));
                }
                nTrueIterations += 2;
    }

         
            }
      
            if( abs( std::inner_product(Nnew.begin(), Nnew.end(), dV.begin(), 0.0) - std::inner_product(Nold.begin(), Nold.end(), dV.begin(), 0.0) ) / std::inner_product(Nold.begin(), Nold.end(), dV.begin(), 0.0) > tolC )
                reStep = true;
      }

 
        else if (Scheme == "BE") {
            int Branch = BE;
            auto cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0, cMat, kVec);
            double dt_FE = *std::min_element(kVec.begin(), kVec.end());
            if (reStep) {
                dt = dt_dec * dt;
                reStep = false;
            }
            else {
                dt = dt_grw * dt;
            }
            if (dt <= dt_FE) {
                Nnew.resize(N_g);
                for (int i = 0; i < N_g; i++) {
                    Nnew[i] = Nold[i];
                    for (int j = 0; j < N_g; j++) {
                        Nnew[i] += dt * cMat[i][j] * Nold[j];
                    }
                }
                nTrueIterations = nTrueIterations + 1;
            }
            else {
                auto NNR = NewtonRaphson(Nold, dt, R_In_H, R_Out_H, N_g, tolBE);
                 Nnew = NNR.first;
                nTrueIterations = nTrueIterations + NNR.second;
                double max_val = 0;
                for (int i = 0; i < N_g; i++) {
                    double tempN = abs(Nnew[i] - Nold[i]) / std::max(Nold[i], 1.0e-8);
                    if (tempN > max_val) {
                        max_val = tempN;
            }
            
            if (max_val > tolN) {
                reStep = true;
    }
}

            }
        }
    
        else {
        int Branch = FE;
        std::pair<std::vector<std::vector<double>>, std::vector<double>> cMat_kVec = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0);
        std::vector<std::vector<double>> cMat = cMat_kVec.first;
        std::vector<double> kVec = cMat_kVec.second;

        double dt = std::min(*std::min_element(kVec.begin(), kVec.end()), dt_grw * dt);

        std::vector<double> Nnew(N_g);
        for (int i = 0; i < N_g; i++) {
            Nnew[i] = Nold[i] + dt * std::inner_product(cMat[i].begin(), cMat[i].end(), Nold.begin(), 0.0);
        }  

        if (!reStep) {
            Nold = Nnew;
            t += dt;
        }
        }
    }

        // --- Display Current Time ---
        if (cycle % cycleD == 0) {
            cout << "Current Time: " << t << endl;
        }

        // --- Write Plotfile ---
        if ((t - t_W0) >= 0.0 && (cycle % cycleW == 0)) {
            PlotFileNumber = Write_Plotfile(t, dt, Nold, eC, dV, kVec, cMat, 0, 0, 0, 0, FE, dt, dt, dt, PlotFileDir, PlotFileName, PlotFileNumber, nPlotFiles);
        }

        // --- Time Step Control ---
        if (!reStep) {
            dt = min(dt_max, dt_grw * dt);
        } else {
            dt = dt_dec * dt;
        }

        // --- Update Time ---
        t += dt;

        if ((t - t_end) >= 0) {
            done = true;
            break;
            }
        }
}
    
