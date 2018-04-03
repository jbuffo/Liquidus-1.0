%% FREZCHEM code call function
function [conditions,solution,solid]=FREZCHEM(input)
%(title,freeze_or_evap,...
%    equil_or_frac,Na,K,Ca,Mg,Cl,SO4,NO3,alkalinity,acidity,Tin,Tf,Tinc)

% params=[title freeze/evap equil/frac.crys Na K Ca Mg Cl SO4 NO3
% alkalinity acidity Tinitial Tfinal Tincrement]
params=input';
dlmwrite('params.txt', params);
system('./frezchem2.exe<params.txt');
%[x,y]=system('wc -l FrOut');
%if length(y)==15
%    conditions=dlmread('FrOut','',[75-72 0 75-72 5]);
%    solution=dlmread('FrOut','',[79-72 1 84-72 6]);
%    solid=dlmread('FrOut','',[90-72 1 139-72 3]);
%else
    conditions=dlmread('FrOut','',[75 0 75 5]);
    solution=dlmread('FrOut','',[79 1 84 6]);
    solid=dlmread('FrOut','',[90 1 139 1]);
%end