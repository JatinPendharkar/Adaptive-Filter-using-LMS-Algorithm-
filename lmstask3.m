clear all
close all

load 09_task3_x_d.mat %load signals x and d
N = 2;
mu = 0.01;

[y,e,w_mat] = lms2(x, d, N, mu);
h = w_mat(:,end);

figure(1)
semilogy(e.^2),
grid on,



function [y,e,w]=lms2(x, d, N, mu);
iter = length(x)
y = zeros(iter,1);          %Output signal
w = zeros(N,iter);          %Filter Coefficient
x_w = zeros(N,1);           %Updated Input Signal vector
e = zeros(iter,1);          %Error signal
w_new = zeros(N,1);         %Updated Filter Coefficient
E = zeros(1,1);             % Summation of the Error

for i = 1:iter
    if i ==1
    x_w(1) = x(i);
    elseif i > 1
        x_w(2) = x_w(1);               %Updated Input Vector
        x_w(1) = x(i);
    end
  
    y(i) = sum((w_new)'* x_w);         %Output signal
   
    e(i) = d(i) - y(i);                %Error signal
   
    w_new = w_new + mu * (e(i) * x_w); %Updating the Filter Coefficient
    w(1,i) = w_new(1);
    w(2,i) = w_new(2);
end
end