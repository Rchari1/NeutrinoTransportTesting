else if (Scheme == "QSS1") {
            vector<vector<double> > cMat_0;
            vector<double> kVec_0;
            vector<vector<double> > cMat_1;
            vector<double> kVec_1;
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
            std::vector<double> N_1(N_g, 0.0);
            std::vector<double> N_2(N_g, 0.0);
            std::vector<double> Error_Observed(N_g, 0.0);
            std::vector<double> Error_Desired(N_g, 0.0);

            if( dt <= dt_FE ){
                N_1 = Nold;
                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_1[i] += (0.5*dt) * (cMat_0[i][j] * Nold[j]);    //update population at 1st half timestep 
                    }
                }

                auto Cmat_K1 = BuildCollisionMatrix_NES(R_In, R_Out, N_1, dV, N_g, 0.0);
                cMat_1 = Cmat_K1.first;
                std::vector<double> tempN1 = N_1;

                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_1[i] += 0.5 * dt * cMat_1[i][j] * tempN1[j];    //update population at 1st half timestep 
                    }
                }

                N_2 = Nold;

                for (int i = 0; i < N_g; i++) {
                    for (int j = 0; j < N_g; j++) {
                        N_2[i] += dt * (cMat_0[i][j] * Nold[j]);    //update population at 2nd half timestep 
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