%This function is used to choose the correct forces from the data that the bearing is subjected to

function [F_Radial,F_Axial] = Choose_Correct_AxialandRadial_forces(DataAll,vVariable,Bearing_Name);
FradialName = [Bearing_Name '_Fradial'];
FaxialName = [Bearing_Name '_Fz'];
% FzName = [Bearing_Name '_Fz'];


IndexX = find(strcmp(vVariable,FradialName));
IndexY = find(strcmp(vVariable,FaxialName));
% IndexZ = find(strcmp(vVariable,FzName));


F_Radial = DataAll(:,IndexX);
F_Axial = DataAll(:,IndexY);
% F_Z = Data(:,IndexZ);

end