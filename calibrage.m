close all
clear all

range = 0:(2^16 - 1);
range = range.* (3.3 / 65535);
poly = [-0.2566 2.2669 -7.5798 11.9577 -10.0720 6.9938];
distance = polyval(poly, range);
plot(d);

for i = 1:65535;
    step_size(i) = d(i) - d(i + 1);
end

lel = range(2:end);
plot(lel, step_size);
% syms x
% poli = 6.9938 - 10.0720*x + 11.9577*x.^2 - 7.5798*x.^3 + 2.2669*x.^4 - 0.2566*x.^5;
% 
% x = range;
% 
% plot(x, subs(poli, x), 'o');

