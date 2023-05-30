% This function is used to find the rotational speed of
% the bearings for a gearbox with two planetary (first two stage)
% stages and one parallel stage (third stage)
% theory behind below calculation can be found in below link: https://en.wikipedia.org/wiki/Epicyclic_gearing
function Rotation_Speed = Calculate_Gear_Speed(Bearing_Name)

Numberofteeth_FirstStage_SunandPinion = 26; %User input
Numberofteeth_SecondStage_SunandPinion = 26; %User input
Numberofteeth_ThirdStage_SunandPinion = 28; %User input

Numberofteeth_FirstStage_PlanetaryandWheel = 31; %User input
Numberofteeth_SecondStage_PlanetaryandWheel = 41; %User input
Numberofteeth_ThirdStage_PlanetaryandWheel = 61; %User input

Numberofteeth_FirstStage_Ring =  89; %User input
Numberofteeth_SecondStage_Ring =  109; %User input

MainShaft_RotSpeed = 9.594 ; %User input
%https://en.wikipedia.org/wiki/Epicyclic_gearing
W_s_FirstStage = ((Numberofteeth_FirstStage_SunandPinion+Numberofteeth_FirstStage_Ring)/Numberofteeth_FirstStage_SunandPinion)*MainShaft_RotSpeed;
W_p_FirstStage = ((Numberofteeth_FirstStage_SunandPinion+Numberofteeth_FirstStage_PlanetaryandWheel)*MainShaft_RotSpeed - Numberofteeth_FirstStage_SunandPinion*W_s_FirstStage)/Numberofteeth_FirstStage_PlanetaryandWheel;

W_s_SecondStage = ((Numberofteeth_SecondStage_SunandPinion+Numberofteeth_SecondStage_Ring)/Numberofteeth_SecondStage_SunandPinion) * W_s_FirstStage;
W_p_SecondStage = ((Numberofteeth_SecondStage_SunandPinion+Numberofteeth_SecondStage_PlanetaryandWheel)*W_s_FirstStage - Numberofteeth_SecondStage_SunandPinion*W_s_SecondStage)/Numberofteeth_SecondStage_PlanetaryandWheel;

W_Outputshaft = (Numberofteeth_ThirdStage_PlanetaryandWheel/Numberofteeth_ThirdStage_SunandPinion)*W_s_SecondStage;

%MS_A,MS_Band PLC1_A have the same rotation speed as the main shaft
if strcmp(Bearing_Name,'MS_A') |  strcmp(Bearing_Name,'MS_B') | strcmp(Bearing_Name,'PLC1_A')  | strcmp(Bearing_Name,'PLC1_B')
Rotation_Speed = MainShaft_RotSpeed ;% Given

%St1_PL1_A, St1_PL1_B, St1_PL1_C, St1_PL1_D have the same rotaion speed
%as the  planetary gears. 

elseif strcmp(Bearing_Name,'St1_PL1_A') | strcmp(Bearing_Name,'St1_PL1_B') | strcmp(Bearing_Name,'St1_PL1_C') | strcmp(Bearing_Name,'St1_PL1_D') | strcmp(Bearing_Name,'St1_PL2_A') | strcmp(Bearing_Name,'St1_PL2_B') | strcmp(Bearing_Name,'St1_PL2_C') | strcmp(Bearing_Name,'St1_PL2_D' ) | strcmp(Bearing_Name, 'St1_PL3_A' )|strcmp (Bearing_Name,'St1_PL3_B') |strcmp(Bearing_Name,'St1_PL3_C' )|strcmp(Bearing_Name,'St1_PL3_D')  | strcmp(Bearing_Name,  'St1_PL4_A') | strcmp(Bearing_Name,'St1_PL4_B') | strcmp(Bearing_Name,'St1_PL4_C' )| strcmp(Bearing_Name,'St1_PL4_D' ) | strcmp(Bearing_Name,  'St1_PL5_A') | strcmp(Bearing_Name,'St1_PL5_B') | strcmp(Bearing_Name,'St1_PL5_C' )|strcmp(Bearing_Name, 'St1_PL5_D')
    Rotation_Speed = abs(W_p_FirstStage) + MainShaft_RotSpeed;

elseif strcmp(Bearing_Name,'PLC2_B') | strcmp(Bearing_Name,'PLC2_A')  
    Rotation_Speed = W_s_FirstStage;

elseif strcmp(Bearing_Name,'PL2_A_1') | strcmp(Bearing_Name,'PL2_B_1')   |  strcmp(Bearing_Name,'PL2_A_2')  | strcmp(Bearing_Name,'PL2_B_2')  | strcmp(Bearing_Name,'PL2_A_3') | strcmp(Bearing_Name,'PL2_B_3' )
    Rotation_Speed =  abs(W_p_SecondStage) + W_s_FirstStage;

elseif strcmp(Bearing_Name,'IMS_A') | strcmp(Bearing_Name,'IMS_B')
    Rotation_Speed = W_s_SecondStage;

elseif strcmp(Bearing_Name,'HS_A') | strcmp(Bearing_Name,'HS_B') 
    Rotation_Speed = W_Outputshaft;
end

end