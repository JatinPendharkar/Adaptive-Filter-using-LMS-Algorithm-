clear all;
close all;
clc;

%------------------------------------------------------
%Data to be used 
% x[k] = 2
%d[k] = 1 
%k =0,1,2,3,....,999.  
%N=1
%mu = 0.01, 0.1, 0.5
%-------------------------------------------------------

len = 1000;
x = ones(len,1)*2;   %column vector of input signal
d = ones(len,1);     %column vector of desired output
N = 1;               %no of coefficients 
mu = 0.01;            %stepsize parameter
y = zeros(len,1);    % column vector ofoutput signal

y = lms1(x, d, N, mu)

figure
plot([x,y,d], 'LineWidth', 2);
legend('x[k]','y[k]','d[k]');
xlabel('k \rightarrow');
ylabel('x[k],y[k],d[k] \rightarrow');

function y = lms1(x, d, N, mu)
%Initializing the Variable
len = 1000;
x = ones(len,1)*2;   %column vector of input signal
d = ones(len,1);     %column vector of desired output
N = 1;               %no of coefficients 
mu = 0.01;           %stepsize parameter
y = zeros(len,1);    % column vector ofoutput signal
w = zeros(30,1);     %Filter Coefficient
% Starting the Iteration
for i=1:1000
   y(i) = sum((w(i)')*x(i));             %Output Signal of the Filter
   
   e(i) = d(i) - y(i);                   %Error Signal
   
   w(i+1) = w(i) + mu * (e(i) * x(i));   % Filter Coefficient 
end
end



