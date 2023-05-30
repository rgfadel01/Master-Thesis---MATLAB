
function  [b,m_n,ft,w,Y_F,Y_S,Y_Betta,Y_B,Y_Dt,K_A,K_V,K_Fbetta,K_Falpha,K_Gamma] = Choose_Correct_Ft_mn_b(Gear_name,DataGearForceAll)


if strcmp(Gear_name,'Third Stage _ Wheel Gear') 
ft=DataGearForceAll(:,1,1); %Transmitted force
b= 500;
m_n=18;
w=480.016;


Y_F=1.078;
Y_S=2.131;
Y_Betta=0.9618;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.037;
K_Fbetta=1.199;
K_Falpha=1.004;
K_Gamma=1;
%15 an 16
end

if strcmp(Gear_name,'Third Stage _ Pinion Gear')
ft=DataGearForceAll(:,1,1); %Transmitted force
b= 500;
m_n=18;
w=480.016;



Y_F=1.046;
Y_S=2.144;
Y_Betta=0.9618;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.037;
K_Fbetta=1.199;
K_Falpha=1.004;
K_Gamma=1;


end






if strcmp(Gear_name,'First Stage _ Planet Gear 5' ) 
A=DataGearForceAll(:,2,1);
B=DataGearForceAll(:,7,1);
ft=max(A,B);
b= 800;
m_n=18;
w=27.5441;



Y_F=1.164;
Y_S=1.878;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.009;
K_Fbetta=1.31;
K_Falpha=1.095;
K_Gamma=1;
end

if strcmp(Gear_name,'First Stage _ Planet Gear 4' ) 

A=DataGearForceAll(:,3,1);
B=DataGearForceAll(:,8,1);
ft=max(A,B);
b= 800;
m_n=18;
w=27.5441;


Y_F=1.164;
Y_S=1.878;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.009;
K_Fbetta=1.31;
K_Falpha=1.095;
K_Gamma=1;
end

if strcmp(Gear_name,'First Stage _ Planet Gear 3' ) 
A=DataGearForceAll(:,4,1);
B=DataGearForceAll(:,9,1);
ft=max(A,B);
b= 800;
m_n=18;
w=27.5441;



Y_F=1.164;
Y_S=1.878;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.009;
K_Fbetta=1.31;
K_Falpha=1.095;
K_Gamma=1;
end


if strcmp(Gear_name,'First Stage _ Planet Gear 2' ) 
A=DataGearForceAll(:,5,1);
B=DataGearForceAll(:,10,1);
ft=max(A,B);
b= 800;
m_n=18;
w=27.5441;


Y_F=1.164;
Y_S=1.878;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.009;
K_Fbetta=1.31;
K_Falpha=1.095;
K_Gamma=1;
end

if strcmp(Gear_name,'First Stage _ Planet Gear 1' ) 
A=DataGearForceAll(:,6,1);
B=DataGearForceAll(:,11,1);
ft=max(A,B);
b= 800;
m_n=18;
w=27.5441;



Y_F=1.164;
Y_S=1.878;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.009;
K_Fbetta=1.31;
K_Falpha=1.095;
K_Gamma=1;
end




if strcmp(Gear_name,'Second Stage _ Planet Gear 3' ) 
A=DataGearForceAll(:,12,1);
B=DataGearForceAll(:,15,1);
ft=max(A,B);
b= 520;
m_n=20;
w=112.815;



Y_F = 0.961;
Y_S = 1.974;
Y_Betta = 0.96112;
Y_B = 1;
Y_Dt = 1;
K_A = 1;
K_V = 1.045;
K_Fbetta = 1.238;
K_Falpha = 1.173;
K_Gamma = 1;
end


if strcmp(Gear_name,'Second Stage _ Planet Gear 2' ) 
A=DataGearForceAll(:,13,1);
B=DataGearForceAll(:,16,1);
ft=max(A,B);
b = 520;
m_n = 20;
w = 112.815;




Y_F = 0.961;
Y_S = 1.974;
Y_Betta = 0.96112;
Y_B = 1;
Y_Dt = 1;
K_A = 1;
K_V = 1.045;
K_Fbetta = 1.238;
K_Falpha = 1.173;
K_Gamma = 1;
end

if strcmp(Gear_name,'Second Stage _ Planet Gear 1' ) 
ft=DataGearForceAll(:,14,1); %Transmitted force
b= 520;
m_n=20;
w=112.815;



Y_F = 0.961;
Y_S=1.974;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.045;
K_Fbetta=1.238;
K_Falpha=1.173;
K_Gamma=1;
end


if strcmp(Gear_name,'Second Stage _ Sun Gear' ) 
A=DataGearForceAll(:,12,1); %Transmitted force
B=DataGearForceAll(:,13,1); %Transmitted force
C=DataGearForceAll(:,14,1); %Transmitted force
A_B=max(A,B); %Transmitted force
ft=max(C,A_B);
b= 520;
m_n=20;
w=220.3356;


Y_F = 0.775;
Y_S=2.284;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.045;
K_Fbetta=1.238;
K_Falpha=1.173;
K_Gamma=1;
end

if strcmp(Gear_name,'First Stage _ Sun Gear' ) 
A=DataGearForceAll(:,2,1); %Transmitted force
B=DataGearForceAll(:,3,1); %Transmitted force
A_B=max(A,B);
C=DataGearForceAll(:,4,1); %Transmitted force
D=max(A_B,C);
E=DataGearForceAll(:,5,1); %Transmitted force
F=max(D,E);
G=DataGearForceAll(:,6,1);
ft=max(F,G);

b= 800;
m_n=30;
w=42.435;


Y_F = 0.9;
Y_S=2.303;
Y_Betta=0.96112;
Y_B=1;
Y_Dt=1;
K_A=1;
K_V=1.045;
K_Fbetta=1.238;
K_Falpha=1.173;
K_Gamma=1;
end

end