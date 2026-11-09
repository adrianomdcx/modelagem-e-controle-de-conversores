% Parametros do conversor Buck-Boost presentes no modelo Simulink.
L = 1059e-6;
C = 100e-6;
R = 10;
Vg = 100;
D = 0.4;

% Primeira etapa da modelagem do manuscrito (pagina 23).
A1 = [0 0; 0 -1/(R*C)];
B1 = [1/L; 0];
C1 = eye(2);
E1 = zeros(2,1);

% Segunda etapa: matriz transcrita do manuscrito (pagina 24).
% As relacoes escalares da mesma pagina apresentam sinais diferentes;
% a divergencia esta registrada no README.
A2 = [0 -1/L; 1/C -1/(R*C)];
B2 = [0; 0];
C2 = eye(2);
E2 = zeros(2,1);

% Matrizes medias e ponto de operacao (paginas 33 e 34).
Am = D*A1 + (1-D)*A2;
Bm = D*B1 + (1-D)*B2;
Cm = D*C1 + (1-D)*C2;
Em = D*E1 + (1-D)*E2;
U = Vg;
Xbb = -(Am\Bm)*U;

% Nomes usados pelo bloco de espaco de estados do modelo.
Ap = Am;
Bp = [Bm (A1-A2)*Xbb+(B1-B2)*U];
Cp = Cm;
Ep = [Em (C1-C2)*Xbb+(E1-E2)*U];
