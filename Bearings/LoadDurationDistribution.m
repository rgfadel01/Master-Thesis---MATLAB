% This function is used to plot the bearing dynamic equivalent load time
% series and also plot the correspondant bearing dynamic equivalent load duration distribution 

function Plot_2_figures = LoadDurationDistribution (EquivalentLoadISO281,Bin_Width,DataAll,vVariable,dt,vTime);
x=EquivalentLoadISO281;
y=vTime;
figure(1);
plot(y,x);
title('Load time-series');
xlabel('Time (s)');
ylabel('Load (N)');
figure(2);
Number_of_Bins=round(max(EquivalentLoadISO281)/Bin_Width) ;

%%%%%%%%%


Absolutevalue_of_the_variable = abs(EquivalentLoadISO281);
h=histogram(Absolutevalue_of_the_variable,Number_of_Bins);
h_new = histogram('BinCounts', h.Values*2e-4, 'BinEdges', h.BinEdges,'Orientation','horizontal');
Plot_2_figures=h_new;
xlabel('Time (s)');
ylabel('Load (N)');
title('Load duration distribution');
end