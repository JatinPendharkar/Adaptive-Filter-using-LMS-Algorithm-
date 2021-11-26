clear all;
close all;
clc;


len = 1000;
x=ones(len,1)*2;                  % Input Signal 
d=ones(len,1);                    %desired Signal
N = 2;                            %Number of System Order
mu = 0.01;                        %Stepsize
iter = length(x);                 %Number of Iterations
% y = zeros(iter,1);              %Output Signal

n = (1e-4)*(randn(length(d),1))   %Noise Signal
d = d + n;                        %desired signal with noise



[y,e,w] = lms2(x, d, N, mu)

%Visualization
figure
plot([x,y,d],'LineWidth', 2);
legend('x[k]','y[k]','d[k]');
xlabel('k \rightarrow');
ylabel('x[k],y[k],d[k] \rightarrow');

figure         %learning curve
semilogy(e.^2,'linewidth',2);
xlabel('k \rightarrow');
ylabel('e.^2 \rightarrow');

figure        %convergence of w[k]=[w1[k],w2[k]],
plot(w(1,:),w(2,:),'x','linewidth',2 );
legend('x[k]','y[k]','d[k]');
xlabel('w_1[k]');
ylabel('w_2[k]');

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
for i = 1:iter
    
    err(i) = e(i).^2;    %Learning curve
      
end
end



