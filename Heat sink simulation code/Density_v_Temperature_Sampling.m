function rho = Density_v_Temperature_Sampling(Tworking)

% Density of SS304 as a function of Temperature

% Experimental data from Table 6 of (which is actually from another source but I'm not chasing that rn, signed 5/23/2022):
% Choong S. Kim,Thermophysical Properties of Stainless Steel (1975)
% https://inldigitallibrary.inl.gov/Reports/ANL-75-55.pdf

temp= [300:100:1600]; % Kelvin

rho_Table = [7894, 7860, 7823, 7783, 7742, 7698, 7652,...
    7603, 7552, 7499, 7444, 7386, 7326, 7264]; % kg/m^3

if Tworking <= temp(1)
    B = [find((temp > Tworking),2),find((temp > Tworking),1)];
    rho = rho_Table(B(1)) + (rho_Table(B(2))-rho_Table(B(1)))*(Tworking-temp(B(1)))/(temp(B(2))-temp(B(1)));
else
    B = [find((temp < Tworking),1,"last"),find((temp > Tworking),1)];
    if (B(2)-B(1)) ~= 1
        rho = rho_Table(mean(B));
    else
        rho = rho_Table(B(1)) + (rho_Table(B(2))-rho_Table(B(1)))*(Tworking-temp(B(1)))/(temp(B(2))-temp(B(1)));
    end
end

% BAD CODE DOESN'T ACCURATELY CALCULATE  AT T = 1600K