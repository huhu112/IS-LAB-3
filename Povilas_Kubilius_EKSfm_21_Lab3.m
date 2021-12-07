%Povilas_Kubilius_EKSfm-21
%Lab3
clc
clear

x = linspace(0,1,20);

y = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;

c1 = 0.2;
c2 = 0.9;

r1 = 0.2;
r2 = 0.2;

h = 0.1;

F = zeros(1,20);
e = 1;

w1 = randn(1);
w2 = randn(1);
w0 = randn(1);

while max(abs(e)) > 0.005
    
    a1 = gaus(c1, r1, x);
    a2 = gaus(c2, r2, x);
    F = a1.*w1 + a2.*w2 + w0;
    
    e = y - F;
    
    w1 = w1 + h.*e.*w1.*a1;
    w2 = w2 + h.*e.*w2.*a2;
    w0 = w0 + h.*e.*w0;
    
end

figure(2)

plot(x, y, 'r-', x, F, 'b-')

function y = gaus(c, r, x)
    y = exp(-(x - c).^2./(2*r.^2));
end