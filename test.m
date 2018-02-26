N = 16;
tension_matrix = [3.27; 3.24; 3.10; 2.83; 2.52; 2.13; 1.76; 1.41; 1.08; 0.804; 0.561; 0.424; 0.301; 0.222; 0.165; 0.124]';
distance_matrix = [0 0.4 0.8 1.2 1.6 2 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0]';
for M = 6
    P = zeros(N, M);
   
    for rangee = 1:N
        for colonne = 1:M
            if colonne == 1
                P(rangee, colonne) = 1;
            else
                P(rangee, colonne) = tension_matrix(rangee).^(colonne-1);
            end
        end
    end
    
    A = (inv(P'*P)*P')*distance_matrix;
    result = 0;
    total = 0;
    
    for index = 1:N
        result = 0;
        % TROUVER LE POLYNOME + REMPLACEMENT DE VALEUR
        for exp = 1:M
            result = result + A(exp)*tension_matrix(index).^(exp-1);
        end
       
        total = total + (result - distance_matrix(index))^2;
    end
  
    % On sait qu'on prend M=6, donc je sauvegarde les valeurs
    if M == 6
        used_A = A;
    end
    
    poly = 0;
    syms x
    % POLYNOME POUR M=X
    for exp = 1:M
        poly = poly + A(exp)*x.^(exp-1);
    end
    
end

disp(used_A);
% REPRESENTATION GRAPHIQUE
x = 0:0.1:3.3;
plot(tension_matrix,distance_matrix,'o',x,subs(poly,x));
title('Données mesurées superposées de la fonction polynomiale calculée')
ylabel('Variation(cm) de la hauteur du floteur par rapport à lhorizontale')
xlabel('Tension(V)')
