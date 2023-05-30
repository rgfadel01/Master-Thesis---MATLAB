%Function to calculate the life modification factor
%Koyo bearings catalogue: https://koyo.jtekt.co.jp/en/support/catalog-download/uploads/catbs008en.pdf
%SKF bearing: https://bearingsize.info/catalogue-online/tapered-roller-bearings/bearing-bt2b-332497-ha4-skf-obj40250.html
%FAG bearing: https://www.abf.store/s/en/bearings/NNU49-630-S-M-C3-FAG/651535

function a_ISO = Calculate_a_ISO(EquivalentLoadISO281,Data,Bearing_Name,Rotation_Speed) %a_ISO: Life modification factor

%Pitch diameter:D_pw: (D+d)/2 in mm 
%Fatigue load limit: C_u in KN
%Actual kinematic viscosity at operating temperature: v in mm^2/s
%Reference kinematic viscosity: v1 in mm^2/s

if strcmp(Bearing_Name,'MS_A')
    D_pw = (2819.4+2133.6)/2; %(D+d)/2
    C_u = 5000*1000; % Verified %https://bearingsize.info/catalogue-online/tapered-roller-bearings/bearing-bt2b-332497-ha4-skf-obj40250.html
    v = 452.529;
    %v_1 = 137.716;

elseif strcmp(Bearing_Name,'MS_B')
    D_pw = (1250+950)/2;
    C_u = 1250*1000;   % Verified
    v = 232.4;
    %v_1 = 205.225;

elseif strcmp(Bearing_Name,'PLC1_A')
     D_pw = (1435+1270)/2;
     C_u = 841*1000; %Verified
     v = 157.836;
     %v_1 = 185.406;

elseif strcmp(Bearing_Name,'PLC1_B')
     D_pw = (1460+1120)/2; %I got this value from Roamax model and the article. I could not verify if this value is true myself. 
     C_u = 2190*1000; %I got this value from Roamax model. I could not verify if this value is true myself.
     v = 157.836; 
     %v_1 = 188.194;

elseif strcmp(Bearing_Name,'St1_PL1_A') | strcmp(Bearing_Name,'St1_PL1_B') | strcmp(Bearing_Name,'St1_PL1_C') | strcmp(Bearing_Name,'St1_PL1_D') | strcmp(Bearing_Name,'St1_PL2_A') | strcmp(Bearing_Name,'St1_PL2_B') | strcmp(Bearing_Name,'St1_PL2_C') | strcmp(Bearing_Name,'St1_PL2_D' ) | strcmp(Bearing_Name, 'St1_PL3_A' )|strcmp (Bearing_Name,'St1_PL3_B') |strcmp(Bearing_Name,'St1_PL3_C' )|strcmp(Bearing_Name,'St1_PL3_D')  | strcmp(Bearing_Name,  'St1_PL4_A') | strcmp(Bearing_Name,'St1_PL4_B') | strcmp(Bearing_Name,'St1_PL4_C' )| strcmp(Bearing_Name,'St1_PL4_D' ) | strcmp(Bearing_Name,  'St1_PL5_A') | strcmp(Bearing_Name,'St1_PL5_B') | strcmp(Bearing_Name,'St1_PL5_C' )|strcmp(Bearing_Name, 'St1_PL5_D')
     D_pw = (650+400)/2; 
     C_u =  583*1000; %Radial value in the catalogue 
     v = 157.836;
     %v_1 = 122.981;

elseif strcmp(Bearing_Name,'PLC2_A')
     D_pw = (1250+950)/2;
     C_u =  1250*1000; % Verified 
     v = 157.836;
     %v_1 = 59.447;

elseif strcmp(Bearing_Name,'PLC2_B')
     D_pw = (1280+900)/2; %I got this value from Roamax model and the article. I could not verify if this value is true myself. 
     C_u = 1340.11*1000; %I got this value from Roamax model. I could not verify if this value is true myself.
     v = 157.836;
     %v_1 = 59.989;
     
elseif strcmp(Bearing_Name,'PL2_A_1') | strcmp(Bearing_Name,'PL2_B_1')   |  strcmp(Bearing_Name,'PL2_A_2')  | strcmp(Bearing_Name,'PL2_B_2')  | strcmp(Bearing_Name,'PL2_A_3') | strcmp(Bearing_Name,'PL2_B_3' )
     D_pw = (580+340)/2;
     C_u = 537*1000; 
     v = 157.836;
     %v_1 = 40.883;

elseif strcmp(Bearing_Name,'IMS_A')
     D_pw = (870+600)/2; 
     %C_u = 670*1000; %GHALAT!! VALUE FROM ROMAX MODEL
     C_u = 1130*1000; %Verified
     v = 157.836;
     %v_1 = 18.489;

elseif strcmp(Bearing_Name,'IMS_B')
     D_pw = (720+500)/2; %I got this value from Roamax model and the article. I could not verify if this value is true myself. 
     C_u = 815*1000; %I got this value from Roamax model. I could not verify if this value is true myself.
     v = 157.836;
     %v_1 = 20.257;

elseif strcmp(Bearing_Name,'HS_A')
     D_pw = (600+360)/2;
     C_u = 670*1000; 
     v = 157.836;
     %v_1 = 11.913;
 
elseif strcmp(Bearing_Name,'HS_B')
     D_pw = (570+300)/2;
     C_u = 721*1000;
     v = 157.836;
     %v_1 = 12.52;
end



% 
% e_C = 0.8; % Contamination factor
% 
% v=20; %in mm^2/s From table 5-6 in bearing catalogue
% Rotation_speed=10; %RPM
 v_1 = (45000*Rotation_Speed^-0.83*D_pw^-0.5); % Equation 28 in ISO 281

Kappa=v/v_1 ;

if Kappa > 4
    Kappa = 4;  %%As per ISO 281 section 9.3.3.4: 'For K values >4, the value k=4 shall be used'
end 

% Contamination factor: e_C
a = 0.0864*Kappa^.68*D_pw^.55;
if a>1
    a=1;
end

e_C =  a*(1-(0.6796/D_pw^(1/3)));


% %%Equation 34 to 36 in book
if Kappa >= 0.1 && Kappa <0.4
a_ISO = 0.1 * (1-(1.5859-1.3993/Kappa^0.054381)*(e_C*C_u./EquivalentLoadISO281).^0.4 ).^-9.185; %Equation 34 in ISO 281
% 34
elseif Kappa >= 0.4 && Kappa < 1
a_ISO = 0.1 * (1-(1.5859-1.2348/Kappa^0.19087)*(e_C*C_u./EquivalentLoadISO281).^0.4 ).^-9.185; %Equation 35 in ISO 281
% 35
elseif Kappa >= 1 && Kappa <=4
a_ISO = 0.1 * (1-(1.5859-1.2348/Kappa^0.071739)*(e_C*C_u./EquivalentLoadISO281).^0.4 ).^-9.185; %Equation 36 in ISO 281
% 36
end


%% As per ISO 281 section 9.3.3.4 'for practical consideration, the
% life modification factor shall be limited to a_ISO <= 50'
b=0;
a_ISO_imag = imag(a_ISO);
imaginary_index = find(a_ISO_imag ~= 0);
a_ISO(imaginary_index) = 0.1;

a_ISO(find(a_ISO >= 3.8)) = 3.8;

% for i = 1:numel(a_ISO)  
% if a_ISO(i) >= 3.8
%  a_ISO(i)=3.8;
% end
% end
% elseif ~isreal (a_ISO(i))
%     b=b+1;
%     c=i;
%     a_ISO(i)=0.1;
%     
% end
end
