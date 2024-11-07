// Headers
#include <iostream>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
// Source Files
#include "Source/Logfile.h"
#include "Source/InitializeNES.h"
#include "Source/RestartCalculation.h"
#include "Source/BuildCollisionMatrix_NES.h"
#include "Source/Write_Plotfile.h"
#include "Source/ComputeRates.h"
#include "Source/NewtonRaphson.h"
#include "Source/logspace.h"
#include "Source/ApplyPerturbation.h"
#include "Source/ComputeNextTimeStep.h"
#include "Source/computeTimeStep_EA.h"

using namespace std;

int main() {

    ///////////////*Debug Block:*///////////////////
    //FILE * pFileD;
    //pFileD = fopen("Debug_printout.txt", "w");

    //int z = 0;
    //int FLG = 0;

    /*
    if (pFileD != NULL){
        fputs ("fopen example",pFileD);
        fclose (pFileD);
    }
    */

    /////////////////////**/////////////////////////


    // --- Computational Parameters ----------------------------
    string Model = "001"; // --- Determines Local Thermodynamic Conditions
    int N_g = 40;    // --- Number of Energy Groups (Must be 40)
    double t_end = 1.0e-02; // [ s ] Final time
    double t = 1.0e-15; // [ s ] Initial time
    double t_W0 = 1.0e-10; // [ s ] Initial write time
    double dt_min = 1.0e-16; // [ s ] Minimum time step
    double dt_max = 0.10; // [ s ] Maximum time step
    double dt = 1.00000000000000000000000e-15; // [ s ] Initial time step
    double dt_grw = 1.10;    // Max dt growth per time step
    double dt_dec = 0.90;    // Decline factor for dt if restep
    double dt_FE = dt, dt_EA = dt, dt_PE = dt, dt_new = dt;
    int reStart = 0;       // For restarting run at a specific data file
    double G_A = 7.5e-01;    // Gaussian Amplitude
    double G_B = 1.0e+02;    // Gaussian Expected Value
    double G_C = sqrt(50.0); // Gaussian Width
    int cycleM = (int)1e9;    // Maximum Cycles
    int cycleD = 100;     // Display Interval
    int cycleW = 10;      // Write Interval
    double tolPE = 1.0e-01;  // Partial Equilibrium Tolerance
    double tolC = 1.0e-08;  // Particle Conservation Tolerance
    double tolBE = 1.0e-08;  // Convergence Tolerance For Backward Euler
    double tolN = 1.0e-02;  // Relative Density Tolerance For Methods 
    double EpsA = 1.0e-04;  // Absolute error tolerance
    double EpsR = 1.0e-04;  // Relative error tolerance
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
    int nPlotFiles = 175; 
    int PertCase = 2;
    double amp = 0.0;
    bool AppPert = false;
    // --- Logs Important Parameters Into A File ---
    Logfile(t_end, t, t_W0, dt, G_A, G_B, G_C, tolC, Scheme, Comment); 

    // Initalizes 
    std::vector<double> eC(N_g, 0.0), dV(N_g, 0.0), N_Eq(N_g, 0.0);
    std::vector<std::vector<double> > R_In(N_g), R_Out(N_g);
    std::vector<double> Nnew(N_g, 0.0);
    std::vector<double> Nold(N_g, 0.0);

    InitializeNES(Model, N_g, eC, dV, R_In, R_Out, N_Eq);


     // Multiply Rates with Momentum Space Volume Element
    vector<vector<double> > R_In_H(N_g);
    vector<vector<double> > R_Out_H(N_g);
    for (int i = 0; i < N_g; i++) {
        R_In_H[i].resize(N_g);
        R_Out_H[i].resize(N_g);
        for (int j = 0; j < N_g; j++) {
            R_In_H[i][j] = R_In[i][j] * dV[i];
            R_Out_H[i][j] = R_Out[i][j] * dV[i];
        }
    }
        vector<double> N_0(N_g);

    if (reStart == 1) {
        N_0 = RestartCalculation(RestartDir, RestartFileName, RestartFileNumber);
    } else {
        for (int i = 0; i < N_g; i++) {
            N_0[i] = G_A * exp(-0.5 * pow((eC[i] - G_B) / G_C, 2));
        }
    }
    Nold = N_0;
    vector<vector<double> > cMat(N_g);
    vector<double> kVec(N_g);
    auto Cmat_K0 = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0);
    cMat = Cmat_K0.first;
    kVec = Cmat_K0.second;

    bool done = false;
    bool reStep = false;
    int cycle = 0;
    int true_cycle = 0;
    int nIterations = 0;
    int nTrueIterations = 0;
    int maxFPIterations = 10000; 
    int mAA = 3;

    // --- Write Initial Condition ---
    PlotFileNumber = Write_Plotfile(t, dt, Nold, eC, dV, kVec, cMat, 0, 0, 0, 0, FE, dt, dt, dt, tolC, dt_grw, dt_max,
                                    PlotFileDir, PlotFileName, PlotFileNumber);
    std::vector<double> wrtTimes = logspace(log10(t_W0), log10(t_end), nPlotFiles);
    int wrtCount = 1;

        // --- Main Time Loop ---
    while (!done) {


        true_cycle++;

            if (!reStep)
        {
            cycle++;
            std::cout<<"Current cycle: " << cycle << std::endl; // Print out current cycle
        }

        // --- Check for Maximum Cycles ---
        if (true_cycle >= cycleM) {
            cout << "Maximum Number of Cycles Exceeded. Exiting Program." << endl;
            done = true;
            break;
        }

        // ---- Main Loop ----
    if (AppPert == true){
        Nold = ApplyPerturbation(Nold, amp, dV, N_g, PertCase);
        }


        if (Scheme == "ExplicitAsymptotic") {
            ///////////////*Debug Block:*///////////////////
            //if (cycle >= 302){
            //    cout << "stop here";            //debug stop point
            //    FLG = 1;
            //    fpfrint(pFileD, "%d, %d, %d \n",z, FLG ,t)
            //}
            /////////////////////**/////////////////////////

            vector<vector<double> > cMat_0;
            vector<double> kVec_0;
            vector<vector<double> > cMat_1;
            vector<double> kVec_1;
            

            int Branch = EA;
            auto Cmat_K0 = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0);
            cMat_0 = Cmat_K0.first;
            kVec_0 = Cmat_K0.second;
            double dt_FE = 1.0 / kVec_0[0];
            for (int i = 1; i < kVec_0.size(); i++) {
                double dt_i = 1.0 / kVec_0[i];
                if (dt_i < dt_FE) {
                    dt_FE = dt_i;
                }
            }

            dt_EA = computeTimeStep_EA( cMat_0, kVec_0, Nold, dV, tolC, dt_FE, dt_new);
            dt = min(dt_EA, dt_new);
            std::vector<double> N_1(N_g, 0.0);
            std::vector<double> N_2(N_g, 0.0);
            //std::vector<double> N_TEMP(N_g, 0.0);
            std::vector<double> Error_Observed(N_g, 0.0);
            std::vector<double> Error_Desired(N_g, 0.0);

            if (cycle >= 30){
                cout << "stop here";
            }

            if( dt <= dt_FE){
                N_1 = Nold;
                for (int i = 0; i < N_g; i++) {
                    double TEMP = N_1[i];
                    for (int j = 0; j < N_g; j++) {
                        TEMP += ((0.5*dt) * (cMat_0[i][j] * Nold[j]));    //update population at 1st half timestep 
                    }
                    N_1[i] = TEMP;
                }

                //N_TEMP = N_1;

                auto Cmat_K1 = BuildCollisionMatrix_NES(R_In, R_Out, N_1, dV, N_g, 0.0);
                cMat_1 = Cmat_K1.first;

                for (int i = 0; i < N_g; i++) {
                    double TEMP = N_1[i];
                    for (int j = 0; j < N_g; j++) {
                        TEMP += ((0.5*dt) * (cMat_1[i][j] * N_1[j]));    //update population at 1st half timestep 
                    }
                    N_1[i] = TEMP;
                }

                //N_2 = Nold;

                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_2[i] = Nold[i] + (dt * (cMat_0[i][j] * Nold[j]));    //update population at 2nd half timestep 
                    }
                }

                Nnew = N_1;
                for (int i = 0; i < N_g; i++) {
                    Error_Observed[i] = abs( N_1[i] - N_2[i] );
                }
                for (int i = 0; i < N_g; i++) {
                    Error_Desired[i] = EpsA + EpsR * abs(N_1[i]);
                }

                dt_new = ComputeNextTimeStep( Error_Observed, Error_Desired, dt );
            }
            else{
                N_1 = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                    N_1[i] += ((0.5*dt) / (1 + kVec_0[i] * (0.5*dt))) * cMat_0[i][j] * Nold[j];    //update population at full timestep 
                    }
                }
                auto Cmat_K1 = BuildCollisionMatrix_NES(R_In, R_Out, N_1, dV, N_g, 0.0);
                cMat_1 = Cmat_K1.first;
                kVec_1 = Cmat_K1.second;

                std::vector<double> TEMP = N_1; 

                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_1[i] = TEMP[i] + ((0.5*dt) / (1 + kVec_1[i] * (0.5*dt))) * cMat_1[i][j] * TEMP[j];                   
                    }
                }
                N_2 = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_2[i] += (dt / (1 + kVec_0[i] * dt)) * cMat_0[i][j] * Nold[j];    //update population at full timestep 
                    }
                }
                Nnew = N_1;

                nTrueIterations = nTrueIterations +2;

                for (int i = 0; i < N_g; i++) {
                    Error_Observed[i] = abs( N_1[i] - N_2[i] );
                }
                for (int i = 0; i < N_g; i++) {
                    Error_Desired[i] = EpsA + EpsR * abs(N_1[i]);
                }
                dt_new = ComputeNextTimeStep( Error_Observed, Error_Desired, dt );
            }

        }
            ///////////////*Debug Block:*///////////////////
            //if (cycle >= 302){
            //    FLG = 2;
            //    fpfrint(pFileD, "%d, %d, %d \n",z, FLG ,t)
            //}
            /////////////////////**/////////////////////////
        
        else if (Scheme == "FE_PE") {
            int Branch = FE_PE;
            auto Cmat_K0 = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, tolPE);
            cMat = Cmat_K0.first;
            kVec = Cmat_K0.second;
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
            //Initalize exp_kdt
            std::vector<double> exp_kdt(N_g,0);
            std::vector<double> inv_k(N_g,0);
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
            auto F0_k0 = ComputeRates(R_In, R_Out, Nold, dV);
            std::vector<double> &F0 = F0_k0.first;
            std::vector<double> &k0 = F0_k0.second;
            kVec = k0;

            for(int i = 0; i < N_g; i++) {
                exp_kdt[i] = exp( - dt * k0[i] );
                inv_k[i] = 1.0 / k0[i];
            }
            
            dt_FE = *std::min_element(inv_k.begin(), inv_k.end());
            

            if( dt <= dt_FE ){
                auto Cmat_K0 = BuildCollisionMatrix_NES( R_In, R_Out, Nold, dV, N_g, 0.0);
                cMat = Cmat_K0.first;
                kVec = Cmat_K0.second;
       
                std::vector<double> Nnew_temp(N_g);    
                Nnew_temp = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        Nnew_temp[i] += dt * cMat[i][j] * Nold[j];  //ForwardEulerupdate
                        }
                    }
                
                Nnew = Nnew_temp; // Replace the original Nnew with the updated values
                nTrueIterations++;
            }
            else
            {
                auto Cmat_K0 = BuildCollisionMatrix_NES( R_In, R_Out, Nold, dV, N_g, 0.0);
                cMat = Cmat_K0.first;
                kVec = Cmat_K0.second;
                std::vector<double> Nnew_temp(N_g);
                Nnew_temp = Nold;
                std::vector<double> MM_temp(N_g);

                for(int i = 0; i < N_g; i++) {
                    for(int j = 0; j < N_g; j++) {
                        MM_temp[i] = ( cMat[i][j] * Nold[i] );
                    }
                }
                for(int i = 0; i < N_g; i++) {
                    Nnew_temp[i] +=  MM_temp[i] * ( 1.0 - exp_kdt[i] ) / k0[i]; //qss1 update
                }
                Nnew = Nnew_temp; // Replace the original Nnew with the updated values
            }
            double sum_Nnew_dV = std::inner_product(Nnew.begin(), Nnew.end(), dV.begin(), 0.0);
            double sum_Nold_dV = std::inner_product(Nold.begin(), Nold.end(), dV.begin(), 0.0);

            if (std::abs((sum_Nnew_dV - sum_Nold_dV) / sum_Nold_dV) > tolC) {
                reStep = true; }
        }
    
        else if (Scheme == "QSS2") {

            //Initalize exp_kdt
            std::vector<double> exp_kdt(N_g,0);
            std::vector<double> inv_k(N_g,0);
            int Branch = QSS2;

            if( reStep )
            {
                dt = dt_dec * dt;
                reStep = false;
            }
            else
            {
                dt = dt_grw * dt;
            }
            auto F0_k0 = ComputeRates(R_In, R_Out, Nold, dV);
            std::vector<double> &F0 = F0_k0.first;
            std::vector<double> &k0 = F0_k0.second;
            kVec = k0;

            for(int i = 0; i < N_g; i++) {
                exp_kdt[i] = exp( - dt * k0[i] );
                inv_k[i] = 1.0 / k0[i];
            }
            
            dt_FE = *std::min_element(inv_k.begin(), inv_k.end());
            

            if( dt <= dt_FE ){
                auto Cmat_K0 = BuildCollisionMatrix_NES( R_In, R_Out, Nold, dV, N_g, 0.0);
                cMat = Cmat_K0.first;
                kVec = Cmat_K0.second;
       
                std::vector<double> Nnew_temp(N_g);    
                Nnew_temp = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        Nnew_temp[i] += dt * cMat[i][j] * Nold[j];  //ForwardEulerupdate
                        }
                    }
                
                Nnew = Nnew_temp; // Replace the original Nnew with the updated values
                nTrueIterations++;
            }
            else 
            {

                //***************************//
                std::vector<double> r0(N_g);    //r0
                std::vector<double> Alpha0(N_g); //The First Alpha
                std::vector<double> Np(N_g);  // Np
                //                  kp = Fp_kp.second;
                //                  Fp = Fp_kp.first;
                std::vector<double> rBAR(N_g);
                std::vector<double> AlphaBAR(N_g); //Corrected Alpha
                std::vector<double> Ft(N_g);
                //std::vector<double> Nnew(N_g);

                //***************************//
                
                //r0 = exp_kdt;
                for (int i = 0; i < N_g; i++) {
                    r0[i] = 1.0 / (k0[i] * dt);
                }   
         
                
                for (int i = 0; i < N_g; i++) {
                Alpha0[i] = ((160 * pow(r0[i],3)) + (60 * pow(r0[i],2)) + (11 * r0[i]) + 1)/
                            ((360 * pow(r0[i],3)) + (60 * pow(r0[i],2)) + (12 * r0[i]) + 1);
                } 

                Np = Nold;
                for (int i = 0; i < N_g; i++) {
                    Np[i] += dt * (F0[i] - (k0[i] * Nold[i])) / (1.0 + (Alpha0[i] * k0[i] * dt));
                }
         
                auto Fp_kp = ComputeRates( R_In, R_Out, Np, dV );
                std::vector<double> kp = Fp_kp.second;
                                    Ft = Fp_kp.first;

                Nnew = Nold;

                std::vector<double> kBAR(N_g);
                for (int i = 0; i < N_g; i++) {
                    kBAR[i] = 0.5 * (kp[i] + k0[i]);
                }
                for (int i = 0; i < N_g; i++) {
                    rBAR[i] = 1.0 / (kBAR[i] * dt);
                }
                for (int i = 0; i < N_g; i++) {
                    AlphaBAR[i] = ((160 * pow(rBAR[i],3)) + (60 * pow(rBAR[i],2)) + (11 * rBAR[i]) + 1)/
                                  ((360 * pow(rBAR[i],3)) + (60 * pow(rBAR[i],2)) + (12 * rBAR[i]) + 1);
                }
                for (int i = 0; i < N_g; i++){
                    Ft[i] = AlphaBAR[i] * Ft[i] + (1.0 - AlphaBAR[i]) * F0[i];
                }
                for (int i = 0; i < N_g; i++){
                    Nnew[i] += dt * (Ft[i] - kBAR[i] * Nold[i]) / (1.0 + (Alpha0[i] * kBAR[i] * dt));
                }
            nTrueIterations += 2;
            }
            double sum_Nnew_dV = std::inner_product(Nnew.begin(), Nnew.end(), dV.begin(), 0.0);
            double sum_Nold_dV = std::inner_product(Nold.begin(), Nold.end(), dV.begin(), 0.0);

            if (std::abs((sum_Nnew_dV - sum_Nold_dV) / sum_Nold_dV) > tolC) {
                reStep = true; 
            }
        }

 
        else if (Scheme == "BE") {
            int Branch = BE;
            auto Cmat_K0 = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0);
            cMat = Cmat_K0.first;
            kVec = Cmat_K0.second;
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
                std::pair<std::vector<double>, int> NNR = NewtonRaphson(Nold, dt, R_In_H, R_Out_H, N_g, tolBE);
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
        auto Cmat_K0 = BuildCollisionMatrix_NES(R_In, R_Out, Nold, dV, N_g, 0.0);
        cMat = Cmat_K0.first;
        kVec = Cmat_K0.second;

        double dt = std::min(*std::min_element(kVec.begin(), kVec.end()), dt_grw * dt);

        std::vector<double> Nnew(N_g);
        for (int i = 0; i < N_g; i++) {
            Nnew[i] = Nold[i] + dt * std::inner_product(cMat[i].begin(), cMat[i].end(), Nold.begin(), 0.0);
        }  

        //if (!reStep) {
        //    Nold = Nnew;
        //    t += dt;
        //}
        }


    // End of case switch

        // --- Display Current Time ---
        if (cycle % cycleD == 0) {
             cout << "Time since simulation initiation: " << t << " seconds passed" << endl;
             cout << "dt: " << dt << endl;

        }
        
        if ( t >= wrtTimes[wrtCount]) {
        // --- Write Plotfile ---
        //if ((t - t_W0) >= 0.0 && (cycle % cycleW == 0)) 
            PlotFileNumber = Write_Plotfile(t, dt, Nold, eC, dV, kVec, cMat, 0, 0, 0, 0, FE, dt, dt, dt, tolC, dt_grw, dt_max,
                                    PlotFileDir, PlotFileName, PlotFileNumber);
            wrtCount = wrtCount +1;
        
        }
       
        // --- Time Step Update---
        if (!reStep) {
            
            Nold = Nnew;
            t += dt;
        }

        if ((t - t_end) >= 0) {
            done = true;
            ///////////////*Debug Block:*///////////////////
            //fclose(pFileD);
            /////////////////////**/////////////////////////
            break;
            }
        }
    }
