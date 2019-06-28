package SystemicTissueParametersPckg 
model SystemicTissueParameters 
  import Physiolibrary.Types.*;
  annotation(defaultComponentName = "tissueParameters");
  parameter HydraulicResistance Ra_celiac_trunk_C116 = 1460894.0;
  parameter HydraulicResistance Rv_celiac_trunk_C116 = 2562548928.0;
  parameter HydraulicInertance I_celiac_trunk_C116 = 520921.28;
  parameter HydraulicCompliance C_celiac_trunk_C116 = 1.6009112e-11;
  parameter Volume Zpv_celiac_trunk_C116 = 5.782434e-07;
  parameter HydraulicResistance Ra_renal_L166 = 4001257.8;
  parameter HydraulicResistance Rv_renal_L166 = 2562548928.0;
  parameter HydraulicInertance I_renal_L166 = 982619.75;
  parameter HydraulicCompliance C_renal_L166 = 1.3015332e-11;
  parameter Volume Zpv_renal_L166 = 5.173628e-07;
  parameter HydraulicResistance Ra_renal_R178 = 4956134.0;
  parameter HydraulicResistance Rv_renal_R178 = 2562548928.0;
  parameter HydraulicInertance I_renal_R178 = 1432232.6;
  parameter HydraulicCompliance C_renal_R178 = 2.7386468e-11;
  parameter Volume Zpv_renal_R178 = 1.0442066e-06;
  parameter HydraulicResistance Ra_internal_iliac_T1_R218 = 11710522.0;
  parameter HydraulicResistance Rv_internal_iliac_T1_R218 = 1127261952.0;
  parameter HydraulicInertance I_internal_iliac_T1_R218 = 3052017.0;
  parameter HydraulicCompliance C_internal_iliac_T1_R218 = 1.1556487e-11;
  parameter Volume Zpv_internal_iliac_T1_R218 = 1.8098397e-06;
  parameter HydraulicResistance Ra_profundus_T2_R224 = 114844940.0;
  parameter HydraulicResistance Rv_profundus_T2_R224 = 931836000.0;
  parameter HydraulicInertance I_profundus_T2_R224 = 17329380.0;
  parameter HydraulicCompliance C_profundus_T2_R224 = 3.8430696e-11;
  parameter Volume Zpv_profundus_T2_R224 = 3.444746e-06;
  parameter HydraulicResistance Ra_anterior_tibial_T3_R230 = 2127074200.0;
  parameter HydraulicResistance Rv_anterior_tibial_T3_R230 = 6668880384.0;
  parameter HydraulicInertance I_anterior_tibial_T3_R230 = 94938530.0;
  parameter HydraulicCompliance C_anterior_tibial_T3_R230 = 7.213731e-12;
  parameter Volume Zpv_anterior_tibial_T3_R230 = 1.6511786e-06;
  parameter HydraulicResistance Ra_posterior_tibial_T4_R236 = 1707921200.0;
  parameter HydraulicResistance Rv_posterior_tibial_T4_R236 = 5752829952.0;
  parameter HydraulicInertance I_posterior_tibial_T4_R236 = 84696470.0;
  parameter HydraulicCompliance C_posterior_tibial_T4_R236 = 8.084671e-12;
  parameter Volume Zpv_posterior_tibial_T4_R236 = 1.8184111e-06;
  parameter HydraulicResistance Ra_internal_iliac_T1_L196 = 11710506.0;
  parameter HydraulicResistance Rv_internal_iliac_T1_L196 = 1130637024.0;
  parameter HydraulicInertance I_internal_iliac_T1_L196 = 3052012.8;
  parameter HydraulicCompliance C_internal_iliac_T1_L196 = 1.1556471e-11;
  parameter Volume Zpv_internal_iliac_T1_L196 = 1.8098372e-06;
  parameter HydraulicResistance Ra_profundus_T2_L202 = 114844940.0;
  parameter HydraulicResistance Rv_profundus_T2_L202 = 932333952.0;
  parameter HydraulicInertance I_profundus_T2_L202 = 17329380.0;
  parameter HydraulicCompliance C_profundus_T2_L202 = 3.8430696e-11;
  parameter Volume Zpv_profundus_T2_L202 = 3.444746e-06;
  parameter HydraulicResistance Ra_anterior_tibial_T3_L208 = 2127079700.0;
  parameter HydraulicResistance Rv_anterior_tibial_T3_L208 = 6670950144.0;
  parameter HydraulicInertance I_anterior_tibial_T3_L208 = 94938776.0;
  parameter HydraulicCompliance C_anterior_tibial_T3_L208 = 7.21375e-12;
  parameter Volume Zpv_anterior_tibial_T3_L208 = 1.6511829e-06;
  parameter HydraulicResistance Ra_posterior_tibial_T4_L214 = 1707921200.0;
  parameter HydraulicResistance Rv_posterior_tibial_T4_L214 = 5755350144.0;
  parameter HydraulicInertance I_posterior_tibial_T4_L214 = 84696470.0;
  parameter HydraulicCompliance C_posterior_tibial_T4_L214 = 8.084671e-12;
  parameter Volume Zpv_posterior_tibial_T4_L214 = 1.8184111e-06;
  parameter HydraulicResistance Ra_ulnar_T2_R42 = 620138430.0;
  parameter HydraulicResistance Rv_ulnar_T2_R42 = 3194699904.0;
  parameter HydraulicInertance I_ulnar_T2_R42 = 40339756.0;
  parameter HydraulicCompliance C_ulnar_T2_R42 = 1.3906783e-11;
  parameter Volume Zpv_ulnar_T2_R42 = 1.4902334e-06;
  parameter HydraulicResistance Ra_radial_T1_R44 = 853560770.0;
  parameter HydraulicResistance Rv_radial_T1_R44 = 3137640000.0;
  parameter HydraulicInertance I_radial_T1_R44 = 53182924.0;
  parameter HydraulicCompliance C_radial_T1_R44 = 1.6687408e-11;
  parameter Volume Zpv_radial_T1_R44 = 1.8025177e-06;
  parameter HydraulicResistance Ra_ulnar_T2_L90 = 620141000.0;
  parameter HydraulicResistance Rv_ulnar_T2_L90 = 3256589952.0;
  parameter HydraulicInertance I_ulnar_T2_L90 = 40339924.0;
  parameter HydraulicCompliance C_ulnar_T2_L90 = 1.3906841e-11;
  parameter Volume Zpv_ulnar_T2_L90 = 1.4902397e-06;
  parameter HydraulicResistance Ra_radial_T1_L92 = 853557950.0;
  parameter HydraulicResistance Rv_radial_T1_L92 = 3081450048.0;
  parameter HydraulicInertance I_radial_T1_L92 = 53182748.0;
  parameter HydraulicCompliance C_radial_T1_L92 = 1.6687355e-11;
  parameter Volume Zpv_radial_T1_L92 = 1.8025117e-06;
  parameter HydraulicResistance Ra_internal_carotid_R8_C = 76031880.0;
  parameter HydraulicResistance Rv_internal_carotid_R8_C = 2553548928.0;
  parameter HydraulicInertance I_internal_carotid_R8_C = 6127977.0;
  parameter HydraulicCompliance C_internal_carotid_R8_C = 1.6901234e-12;
  parameter Volume Zpv_internal_carotid_R8_C = 3.4752958e-07;
  parameter HydraulicResistance Ra_external_carotid_T2_R26 = 23593136.0;
  parameter HydraulicResistance Rv_external_carotid_T2_R26 = 2553548928.0;
  parameter HydraulicInertance I_external_carotid_T2_R26 = 3973211.0;
  parameter HydraulicCompliance C_external_carotid_T2_R26 = 1.1266578e-11;
  parameter Volume Zpv_external_carotid_T2_R26 = 9.837513e-07;
  parameter HydraulicResistance Ra_internal_carotid_L50_C = 76031880.0;
  parameter HydraulicResistance Rv_internal_carotid_L50_C = 2562548928.0;
  parameter HydraulicInertance I_internal_carotid_L50_C = 6127977.0;
  parameter HydraulicCompliance C_internal_carotid_L50_C = 1.6901234e-12;
  parameter Volume Zpv_internal_carotid_L50_C = 3.4752958e-07;
  parameter HydraulicResistance Ra_external_carotid_T2_L62 = 23593212.0;
  parameter HydraulicResistance Rv_external_carotid_T2_L62 = 2562548928.0;
  parameter HydraulicInertance I_external_carotid_T2_L62 = 3973224.0;
  parameter HydraulicCompliance C_external_carotid_T2_L62 = 1.1266614e-11;
  parameter Volume Zpv_external_carotid_T2_L62 = 9.837545e-07;
  parameter HydraulicResistance Ra_vertebral_L2 = 672135400.0;
  parameter HydraulicResistance Rv_vertebral_L2 = 2562548928.0;
  parameter HydraulicInertance I_vertebral_L2 = 39321880.0;
  parameter HydraulicCompliance C_vertebral_L2 = 1.0753675e-11;
  parameter Volume Zpv_vertebral_L2 = 1.1749546e-06;
  parameter HydraulicResistance Ra_vertebral_R272 = 673356200.0;
  parameter HydraulicResistance Rv_vertebral_R272 = 2553548928.0;
  parameter HydraulicInertance I_vertebral_R272 = 39393300.0;
  parameter HydraulicCompliance C_vertebral_R272 = 1.0773207e-11;
  parameter Volume Zpv_vertebral_R272 = 1.1770887e-06;
end SystemicTissueParameters;
end SystemicTissueParametersPckg;
