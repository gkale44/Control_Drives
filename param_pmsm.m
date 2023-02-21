%parameters of the pmsm

Rs=5;% [V/A]stator resistance
Ls=0.1;%[Vs/A] STATOR inductance
P=2;% number of pole pair
J=0.01;%[kgm^2] mass moment of inertia
psi_PM=0.6;%[Vs] permanent magnet flux linkage
u_N=325;%[V] AMPLITUDE of grid voltage
w_N=100*pi;%[1/s] angular frequency

clarke=2/3*[1 -0.5 -0.5;0 sqrt(3)/2 -sqrt(3)/2]; %clarke transformation
inv_clarke=[1 -0.5 -0.5;0 sqrt(3)/2 -sqrt(3)/2]';%inverse clearke

fc=5000;
Udc=565;% [V]dc bus voltage
m=1;

% design of curent controller
Ts=1/(100*fc);%[s] simulation step size
V1 = Udc/2;% gain coeficient of converter model
T1 = 1/fc;% equivalent time constant for converter model
V2 = 1/Rs;% gain of stator coil model
T2 = Ls/Rs;% time constant of stator coil model
VrI = T2/(2*V1*V2*T1);% overall pi controller gain
TnI = T2; % pi controller time constant

%design of speed controller
VI = 1; % overall gain oc closed loop curent control
TI = 2/fc;% time constant of simplified transfer function

% for closed loop curent control loop
VII = (1.5)*(100)*psi_PM; % remaining gain of control
VrN = 1/(2*VI*VII*TI); % overall controller gain
TnN = 4*TI; % speed controller time constant according to so
Ismax = 5; % maximum stator current

Lsd=0.1; %[Vs/A] stato inductance d component
Lsq=0.1; %[Vs/A] stato inductance q component

% design of curent controller
Ts=1/(100*fc);%[s] simulation step size
V1 = Udc/2;% gain coeficient of converter model
T1 = 1/fc;% equivalent time constant for converter model
V2 = 1/Rs;% gain of stator coil model
T2d = Lsd/Rs;% time constant of stator coil model
VrId = T2d/(2*V1*V2*T1);% overall pi controller gain
TnId = T2d; % pi controller time constant

T2q = Lsq/Rs;% time constant of stator coil model
VrIq = T2q/(2*V1*V2*T1);% overall pi controller gain
TnIq = T2q; % pi controller time constant

