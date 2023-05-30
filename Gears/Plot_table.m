function Construct_Table = Plot_table(Gears,DataGearForceAll,vTimeAll);





Damage = zeros(max(size(Gears)),1);

for l=1:numel(Gears)
    Gear_name = Gears(l);
    Gear_name = char(Gear_name);
% [b,m_n,ft,w] = Choose_Correct_Ft_mn_b(Gear_name,DataGearForceAll);
[b,m_n,ft,w,Y_F,Y_S,Y_Betta,Y_B,Y_Dt,K_A,K_V,K_Fbetta,K_Falpha,K_Gamma] = Choose_Correct_Ft_mn_b(Gear_name,DataGearForceAll);

Multiplyby = (Y_F * Y_S*Y_Betta*Y_B*Y_Dt)*K_A*K_V*K_Fbetta*K_Falpha*K_Gamma/(b*m_n);
% Multiplyby = (Load_Sharing_Factor * Application_Factor*Dynamic_Factor*Face_Load_Factor*Transverse_Load)*Form_Factor_Planet*Stress_Correction_Factor_Planet*Helix_Angle_Facor_Planet*Helix_Angle_Facor_Planet*Deep_Tooth_Factor/(b*m_n);

S=Multiplyby*ft;
h=histogram(S);
h_new_new = histogram('BinCounts', h.Values*2e-4*w/10, 'BinEdges', h.BinEdges,'Orientation','horizontal');
n_i=h_new_new.Values;
m= 6.901;
k=2.372*10^26;
N_ci = zeros(max(size(n_i)),1);
j=1;
for i=min(abs(S)):h_new_new.BinWidth:max(abs(S))
    N_ci(j) = k*i^-m;
    j=j+1;
end
if mean(S) < 0
N_ci (max(size(n_i))) = k*max(abs(S))^-m;
end
Damage(l) = sum(n_i'./N_ci) * 6;
end




Details = [Damage];
T = array2table(Details,...
    'VariableNames',{'Damage'},...
     'RowNames',Gears'); 
disp(T) 
Construct_Table=1;
end