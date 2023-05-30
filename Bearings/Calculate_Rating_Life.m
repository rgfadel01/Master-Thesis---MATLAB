%This function is used to calculate the basic and modified rating life in
%both Mrevs and hours. Moreover, the damage per hour is also calculated
%using this function
function [L_10,L_10_H,L_5,L_5_H,percentage_damage_L5]= Calculate_Rating_Life(a_ISO,EquivalentLoadISO281,DataAll,Bearing_Name,Rotation_Speed);

a_1=0.64; % From table 12 in ISO 281  for 95% reliability

%Value for Basic Dynamic Radial Load equation 13
if strcmp(Bearing_Name,'St1_PL1_A') | strcmp(Bearing_Name,'St1_PL1_B') | strcmp(Bearing_Name,'St1_PL1_C') | strcmp(Bearing_Name,'St1_PL1_D') | strcmp(Bearing_Name,'St1_PL2_A') | strcmp(Bearing_Name,'St1_PL2_B') | strcmp(Bearing_Name,'St1_PL2_C') | strcmp(Bearing_Name,'St1_PL2_D')|strcmp(Bearing_Name,'St1_PL3_A') | strcmp(Bearing_Name,'St1_PL3_B') | strcmp(Bearing_Name,'St1_PL3_C') | strcmp(Bearing_Name,'St1_PL3_D')| strcmp(Bearing_Name,'St1_PL4_A') | strcmp(Bearing_Name,'St1_PL4_B') | strcmp(Bearing_Name,'St1_PL4_C') | strcmp(Bearing_Name,'St1_PL4_D')|strcmp(Bearing_Name,'St1_PL5_A') | strcmp(Bearing_Name,'St1_PL5_B') | strcmp(Bearing_Name,'St1_PL5_C') | strcmp(Bearing_Name,'St1_PL5_D') | strcmp(Bearing_Name,'PL2_A_2')| strcmp(Bearing_Name,'PL2_A_3')| strcmp(Bearing_Name,'PL2_B_1')| strcmp(Bearing_Name,'PL2_B_2')| strcmp(Bearing_Name,'PL2_B_3')
C_r=3670*1000;
elseif strcmp(Bearing_Name,'MS_A')
C_r=34700*1000;
elseif strcmp(Bearing_Name,'MS_B')
C_r=7860*1000;
elseif strcmp (Bearing_Name,'PLC1_A')
C_r=3650*1000;
elseif strcmp(Bearing_Name,'PLC1_B')
C_r=10000*1000; %Cr value is 10500 using this link https://www.amroll.com/double-row/NNU49-1120 and 10 000 using this link https://www.edabearing.net/sf-NNU491120W33-shop-3940.html
elseif strcmp(Bearing_Name,'PLC2_A')
C_r=7860*1000; %Catalogue
elseif strcmp(Bearing_Name,'PLC2_B')
C_r=9340*1000; % https://koyo.jtekt.co.jp/en/products/detail/?pno=452/900
elseif strcmp(Bearing_Name,'PL2_A_1') | strcmp(Bearing_Name,'PL2_B') %%%%%NOTE!!!! Correct this
C_r=3790*1000;
elseif strcmp(Bearing_Name,'IMS_A')
C_r=7080*1000;
elseif strcmp(Bearing_Name,'IMS_B')
C_r=4730*1000; %https://www.skf.com/dk/productinfo/productid-314419
elseif strcmp(Bearing_Name,'HS_A')
C_r=5737*1000; %https://www.skf.com/au/products/rolling-bearings/roller-bearings/spherical-roller-bearings/productid-24172%20ECCJ%2FW33
elseif strcmp(Bearing_Name,'HS_B')
C_r=4790*1000;
end
L_10_P = (C_r./EquivalentLoadISO281).^(10/3);
L_5_P = (a_1.*a_ISO).*L_10_P;

a=size(DataAll);
T_cst=1/a(1);

denom_for_L10P=0;
denom_for_L5P=0;
for i = 1:numel(L_10_P)  
addvalue_L10P= T_cst./L_10_P(i);
addvalue_L5P= T_cst./L_5_P(i);

denom_for_L10P=denom_for_L10P+addvalue_L10P;
denom_for_L5P=denom_for_L5P+addvalue_L5P;
end
L_10=1/denom_for_L10P;
L_10_H = L_10*10^6/(60*Rotation_Speed);
L_5=1/denom_for_L5P;
L_5_H=L_5*10^6/(60*Rotation_Speed);
percentage_damage_L5=(1/L_5_H)*100;
end