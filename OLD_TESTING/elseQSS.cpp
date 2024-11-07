else {
                    std::vector<double> N_1(N_g, 0.0);
                    std::vector<double> N_2(N_g, 0.0);
                    std::vector<double> Error_Observed(N_g, 0.0);
                    std::vector<double> Error_Desired(N_g, 0.0);
                      
                    auto Np_Alpha0 = QSS1( F0, k0, 0.5*dt, Nold);
                    std::vector<double> Np = Np_Alpha0.first;
                    std::vector<double> Alpha0 = Np_Alpha0.second;
             
                    auto Fp_kp = ComputeRates( R_In, R_Out, Np, dV );
                    std::vector<double> kp = Fp_kp.second;
                    std::vector<double> Fp = Fp_kp.first;

                    N_1 =  QSS2( F0, Fp, k0, kp, Alpha0, 0.5*dt, Nold);

                    Np_Alpha0 =  QSS1( F0, k0, 0.5*dt, N_1);
                    Np = Np_Alpha0.first;
                    Alpha0 = Np_Alpha0.second;

                    Fp_kp = ComputeRates( R_In, R_Out, Np, dV );
                    kp = Fp_kp.second;
                    Fp = Fp_kp.first;

                    N_1 =  QSS2( F0, Fp, k0, kp, Alpha0, 0.5*dt, N_1);

                    Np_Alpha0 = QSS1( F0, k0, dt, Nold);
                    Np = Np_Alpha0.first;
                    Alpha0 = Np_Alpha0.second;
                    
                    Fp_kp = ComputeRates( R_In, R_Out, Np, dV );
                    kp = Fp_kp.second;
                    Fp = Fp_kp.first;

                    N_2 =  QSS2( F0, Fp, k0, kp, Alpha0, dt, Nold);


                    for (int i = 0; i < N_g; i++) {
                        Error_Observed[i] = abs( N_1[i] - N_2[i] );
                    }
                    for (int i = 0; i < N_g; i++) {
                        Error_Desired[i] = EpsA + EpsR * abs(N_1[i]);
                    }
                    dt_new = ComputeNextTimeStep( Error_Observed, Error_Desired, dt );
