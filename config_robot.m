% Posición de contacto
x_r = [1.2; 0.7]; %m

% Fuerza deseada
f_d = [10; 0]; % N

% Parámetros de estado inicial
x_e_initial = [1.3; 0.7];

% Matrices de Impedancia y Ganancias del controlador
K = [1000, 0; 
     0,    0];

M_d = [1000, 0; 
       0,    1000];

K_D = [5000, 0; 
       0,    5000];

K_P = [5000, 0; 
       0,    5000];

% Ganancias de control de fuerza (C_F)
K_F = [0.03, 0; 
       0,    0];

K_I = [0.03, 0; 
       0,    0];
