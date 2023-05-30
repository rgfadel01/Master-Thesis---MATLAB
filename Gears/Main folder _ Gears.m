

%Input from user: Gears to analyze:
Gears = {'First Stage _ Sun Gear' 'First Stage _ Planet Gear 1' 'First Stage _ Planet Gear 2' 'First Stage _ Planet Gear 3' 'First Stage _ Planet Gear 4' 'First Stage _ Planet Gear 5' ...
    'Second Stage _ Sun Gear' 'Second Stage _ Planet Gear 1' 'Second Stage _ Planet Gear 2' 'Second Stage _ Planet Gear 3' ...
    'Third Stage _ Pinion Gear' 'Third Stage _ Wheel Gear'};


Construct_Table = Plot_table(Gears,DataGearForceAll,vTimeAll);
