% This function is used to calculate the 'bearing dynamic equivalent load' needed
% to calculate the 'basic rating life' of the bearing

function EquivalentLoadISO281 = Calculate_EquivalentLoadISO281(F_Radial,F_Axial,vVariable,Bearing_Name)

Radial_Load=F_Radial;
Axial_Load=abs(F_Axial);

if strcmp(Bearing_Name,'St1_PL1_A') | strcmp(Bearing_Name,'St1_PL1_B') | strcmp(Bearing_Name,'St1_PL1_C') | strcmp(Bearing_Name,'St1_PL1_D') | strcmp(Bearing_Name,'St1_PL2_A') | strcmp(Bearing_Name,'St1_PL2_B') | strcmp(Bearing_Name,'St1_PL2_C') | strcmp(Bearing_Name,'St1_PL2_D')|strcmp(Bearing_Name,'St1_PL3_A') | strcmp(Bearing_Name,'St1_PL3_B') | strcmp(Bearing_Name,'St1_PL3_C') | strcmp(Bearing_Name,'St1_PL3_D')| strcmp(Bearing_Name,'St1_PL4_A') | strcmp(Bearing_Name,'St1_PL4_B') | strcmp(Bearing_Name,'St1_PL4_C') | strcmp(Bearing_Name,'St1_PL4_D')|strcmp(Bearing_Name,'St1_PL5_A') | strcmp(Bearing_Name,'St1_PL5_B') | strcmp(Bearing_Name,'St1_PL5_C') | strcmp(Bearing_Name,'St1_PL5_D') | strcmp(Bearing_Name,'PL2_A_1') | strcmp(Bearing_Name,'PL2_A_2')| strcmp(Bearing_Name,'PL2_A_3')| strcmp(Bearing_Name,'PL2_B_1')| strcmp(Bearing_Name,'PL2_B_2')| strcmp(Bearing_Name,'PL2_B_3')
cst_e = 0.87;
alpha=atand(cst_e/1.5);
elseif strcmp(Bearing_Name,'MS_A')
    cst_e = 0.94;
alpha=atand(cst_e/1.5);
%     alpha = 35;
elseif strcmp(Bearing_Name,'MS_B')
        cst_e = 0.57;
alpha=atand(cst_e/1.5);
%     alpha = 26.065;
elseif strcmp (Bearing_Name,'PLC1_A')
    alpha = 20.875;
    cst_e = 1.5*tand(alpha);
elseif strcmp(Bearing_Name,'PLC1_B')
    alpha = 0;
    cst_e = 1.5*tand(alpha);
elseif strcmp(Bearing_Name,'PLC2_A')
        cst_e = 0.73;
alpha=atand(cst_e/1.5);
%     alpha = 26.065;
elseif strcmp(Bearing_Name,'PLC2_B')
     cst_e = 0.39;
alpha=atand(cst_e/1.5);
 %   alpha = 14.5; %How is that possibe? This is noted as CRB in the table
elseif strcmp(Bearing_Name,'PL2_A') | strcmp(Bearing_Name,'PL2_B')
            cst_e = 0.32;
alpha=atand(cst_e/1.5);
%     alpha = 11.984;
elseif strcmp(Bearing_Name,'IMS_A')
     cst_e = 0.4;
alpha=atand(cst_e/1.5);
%     alpha = 14.995;
elseif strcmp(Bearing_Name,'IMS_B')
    alpha = 0; % In table A4 this is mentioned as TRB, it should be changed to CRB
    cst_e = 1.5*tand(alpha);
elseif strcmp(Bearing_Name,'HS_A')
cst_e = 0.4;
alpha=atand(cst_e/1.5);  
elseif strcmp(Bearing_Name,'HS_B')
    cst_e = 0.87;
alpha=atand(cst_e/1.5);
%     alpha = 29.982;
end
% 
% cst_e=0.87;
% alpha=atand(cst_e/1.5);

X=zeros((max(size(Axial_Load))),1); % 
Y=zeros((max(size(Axial_Load))),1); % 
%Table 8
% for i=1:size(Axial_Load)
% if  (Axial_Load(i)\Radial_Load(i)) <= cst_e 
% X(i) = 1;
% Y(i) = 0.45 * cotd(alpha);
% 
% elseif (Axial_Load(i)\Radial_Load(i)) > cst_e  
%     X(i) = 0.67;
%     Y(i) = 0.67 * cotd(alpha); 
% end
% end


 %Table 8
 for i=1:max(size(Axial_Load))
 if  alpha == 0
     X(i) = 1 ;
     Y(i) = 0 ;
 elseif (Axial_Load(i)/Radial_Load(i)) <= cst_e && alpha ~= 0
     X(i)= 1;
     Y(i) = 0.45 * cotd(alpha);
  elseif (Axial_Load(i)/Radial_Load(i)) > cst_e  && alpha ~= 0
      X(i) = 0.67;
      Y(i) = 0.67 * cotd(alpha); 
  end
 end
EquivalentLoadISO281=X.*Radial_Load+Y.*Axial_Load;
end