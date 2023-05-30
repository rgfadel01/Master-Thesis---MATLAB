% Enter the name of the bearings you want to study
Bearings = { 'St1_PL1_A' 'St1_PL1_B' 'St1_PL1_C' 'St1_PL1_D' ... % Bearings of the first planetary stage
    'St1_PL2_A' 'St1_PL2_B' 'St1_PL2_C' 'St1_PL2_D' ...
    'St1_PL3_A' 'St1_PL3_B' 'St1_PL3_C' 'St1_PL3_D' ...
    'St1_PL4_A' 'St1_PL4_B' 'St1_PL4_C' 'St1_PL4_D' ...
    'St1_PL5_A' 'St1_PL5_B' 'St1_PL5_C' 'St1_PL5_D' ...
    'HS_A' 'HS_B' ...           % Main shaft bearings
    'PL2_A_1' 'PL2_B_1'  ... % Bearings of the secondary stage
    'PL2_A_2' 'PL2_B_2'  ... 
    'PL2_A_3' 'PL2_B_3'  ...    
    'PLC2_A' 'PLC2_B'  ...   % Second planetary carrier bearings
    'IMS_A' 'IMS_B' ... % Intermediate speed shaft
    };
dt = 2e-4; % Time step size

Construct_Table = Plot_table(Bearings,DataAll,vVariable,dt,vTime);

% Reference_DataAll=DataAll;
