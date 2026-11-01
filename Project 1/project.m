
clc;
clear;
close all;

%% Parameters
alpha = 1;
beta  = 0.1;
delta = 0.01;
gamma = 1;

%% Initial Conditions
x0 = 40;
y0 = 9;

z0 = [x0; y0];

%% Simulation Time
tspan = [0 30];

%% Lotka-Volterra Equations
f = @(t,z) [
    alpha*z(1) - beta*z(1)*z(2);
    delta*z(1)*z(2) - gamma*z(2)
];

%% Numerical Solution
[t,z] = ode45(f,tspan,z0);

%% Extract Variables
Prey = z(:,1);
Predator = z(:,2);

%% Plot Population
figure;

plot(t,Prey,'b','LineWidth',2);
hold on;
plot(t,Predator,'r','LineWidth',2);

xlabel('Time');
ylabel('Population');
title('Predator-Prey Model');

legend('Prey','Predator');
grid on;

%% Phase Portrait
figure;

plot(Prey,Predator,'LineWidth',2);

xlabel('Prey Population');
ylabel('Predator Population');

title('Phase Portrait');
grid on;
