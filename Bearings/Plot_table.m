function Construct_Table = Plot_table(Bearings,DataAll,vVariable,dt,vTime)


for i=1:numel(Bearings)
    Bearing_Name = Bearings(i) ;
    Bearing_Name = char(Bearing_Name);
    [F_Radial,F_Axial] = Choose_Correct_AxialandRadial_forces(DataAll,vVariable,Bearing_Name); %Note: Values in N
EquivalentLoadISO281 = Calculate_EquivalentLoadISO281(F_Radial,F_Axial,vVariable,Bearing_Name); %Equation 14 in ISO 281 %in N
%  Plot_2_figures = LoadDurationDistribution (EquivalentLoadISO281,Bin_Width,DataAll,vVariable,dt,vTime);
Rotation_Speed = Calculate_Gear_Speed(Bearing_Name);
a_ISO = Calculate_a_ISO(EquivalentLoadISO281,DataAll,Bearing_Name,Rotation_Speed);
[L_10,L_10_H,L_5,L_5_H,percentage_damage_L5] = Calculate_Rating_Life(a_ISO,EquivalentLoadISO281,DataAll,Bearing_Name,Rotation_Speed);
BasicRatingLife_Store(i) = L_10;
BasicRatingLife_Hours_Store(i) = L_10_H;
ModifiedRatingLife_Store(i) = L_5;
ModifiedRatingLife_Hours_Store(i) = L_5_H;
Damage_percentage_Store(i) = percentage_damage_L5;
end


Details = [BasicRatingLife_Store',BasicRatingLife_Hours_Store',ModifiedRatingLife_Store',ModifiedRatingLife_Hours_Store',Damage_percentage_Store'];
T = array2table(Details,...
    'VariableNames',{'BasicRatingLife_Mrevs' 'BasicRatingLife_Hours' 'ModifiedRatingLife_Mrevs' 'ModifiedRatingLife_Hours' 'Damage_percentage'},...
     'RowNames',Bearings'); 
disp(T) 
Construct_Table=1;
end
