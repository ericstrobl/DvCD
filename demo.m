clear all
clc

x = CreateArtificialMB(500,10);

disp('ExcCD')
[Ranked,KCDM] = ExcCD(x,4,'lin','reg',1E-4);
Ranked

disp('ExcD')
[Ranked,KDM] = ExcD(x,4,'lin','reg');
Ranked

disp('IncD')
[Ranked,KDM] = IncD(x,4,'lin','reg');
Ranked
