% Fernando Patlan, MECE 6341 Modeling of Physical Systems
% Problem 1 - Mass, Spring, Damper system

clc % clear the command code in command window
clear all % clears variables and cache memory

%Set up constants of system
m=2; % mass in kg
k=7000; % spring constant in N/m
b=50; % damper viscosity in N/(m/s)
F=400; % force in N

%Set up state of system
A=[ 0   1;
   -k/m -b/m];
B=[0;
   1/m];
C=[ 1 0;
    0 1;
    -k/m -b/m];
D=[0 0 1/m]'; % D matrix transposed to give 3x1matrix
x0=[0 0]'; % state vector initial values
tf= 1;  %final time, 1 second
t1=[0:0.01:tf];  %time interval in steps of 0.01 seconds
u=F*ones(size(t1)); % Fcos(t1); force wrt time

%Plotting the system
sys1=ss(A,B,C,D);
[y,t,x]=lsim(sys1,u,t1,x0); % y gives outputs
figure(1)
subplot(311) %Position v Time plot
plot(t,y(:,1), '-b', LineWidth=1.5)
xlabel('Time (Sec)', 'fontsize', 14)
ylabel('Position (m)', 'fontsize', 14)
grid
subplot(312) %Velocity v Time plot
plot(t, y(:,2), '-r', LineWidth=1.5)
xlabel('Time (Sec)', 'fontsize', 14)
ylabel('Velocity (m/s)', 'fontsize', 14)
grid
subplot(313) %Acceleration v Time plot
plot(t,y(:,3), '-g', LineWidth=1.5)
xlabel('Time (Sec)', 'fontsize', 14)
ylabel('Accel. (m/s2)', 'fontsize', 14)
grid