function Cp = SpecificHeat_v_Temperature_Sampling(Tworking)

% Cp of SS304 as a function of Temperature

% Bergman et al. Fundamentals of Heat and Mass Transfer 7th edition
%  ISBN-10 : 0470917857
% Table A.1

temp= [100 200 400 600 800 1000 1200 1500]; % Kelvin

Cp_Table = [272, 402, 515, 557, 582, 611, 640, 682]; % J/(kg*K)

if Tworking >= temp(length(temp))
    B = [find((temp < Tworking),2,"last"),find((temp > Tworking),1,"last")];
    Cp = Cp_Table(B(1)) + (Cp_Table(B(2))-Cp_Table(B(1)))*(Tworking-temp(B(1)))/(temp(B(2))-temp(B(1)));
else
    B = [find((temp < Tworking),1,"last"),find((temp > Tworking),1)];
    if (B(2)-B(1)) ~= 1
        Cp = Cp_Table(mean(B));
    else
        Cp = Cp_Table(B(1)) + (Cp_Table(B(2))-Cp_Table(B(1)))*(Tworking-temp(B(1)))/(temp(B(2))-temp(B(1)));
    end
end

% BAD CODE DOESN'T ACCURATELY CALCULATE  AT T = 1500K