close all
clear all
%On veut toute les valeurs possible sur 12bits
range = 0:(2^12 - 1);
range = range.* (3.3 / 4095);
poly = [-0.2566 2.2669 -7.5798 11.9577 -10.0720 6.9938];
distance = polyval(poly, range);
figure(1)
plot(range,distance);
title('d en fonction de NV')
ylabel('d(cm)')
xlabel('Tension(V)')
%On calcule chaque marche sur toute les valeurs
for i = 1:4095;
    step_size(i) = distance(i) - distance(i + 1);
end

x = range(2:end);
figure(2)
plot(x, step_size);
title('Hauteur des marches en fonction de NV')
ylabel('Hauteur(cm) des marches')
xlabel('Tension(V)')
