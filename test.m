N = 16;
current_min_rms = 1000;
min_rms_M = 0;

open_matrix = [3.27; 3.24; 3.10; 2.83; 2.52; 2.13; 1.76; 1.41; 1.08; 0.804; 0.561; 0.424; 0.301; 0.222; 0.165; 0.124]';
coeff_matrix = [0 0.4 0.8 1.2 1.6 2 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0]';


for M = 6
    P = zeros(N, M);
   
    for rangee = 1:N
        for colonne = 1:M
            if colonne == 1
                P(rangee, colonne) = 1;
            else
                P(rangee, colonne) = open_matrix(rangee).^(colonne-1);
            end
        end
    end
    
    A = (inv(P'*P)*P')*coeff_matrix;
    result = 0;
    total = 0;
    
    for index = 1:N
        result = 0;
        % TROUVER LE POLYNOME + REMPLACEMENT DE VALEUR
        for exp = 1:M
            result = result + A(exp)*open_matrix(index).^(exp-1);
        end
       
        total = total + (result - coeff_matrix(index))^2;
    end
    
  

    % On sait qu'on prend M=5, donc je sauvegarde les valeurs
    if M == 6
        used_A = A;
    end
    
    % REPRESENTATION GRAPHIQUE
    poly = 0;
    syms opening
    % POLYNOME POUR M=X
    for exp = 1:M
        poly = poly + A(exp)*opening.^(exp-1);
    end
    
end

% FIND OPENING PERCENTAGE FROM FRICTION COEFFICIENT
% PLACEHOLDER VALUES FOR NOW
disp(used_A);
