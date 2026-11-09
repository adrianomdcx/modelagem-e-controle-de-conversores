L = 500e-6;
C= 100e-6;
R=5;
Vg= 48;
D=0.4;

%1 etapa da modelagem:

A1= [0 0 
    0 -1/(R*C)];
B1= [1/L 
    0];
C1= [1 0 ; 0 1];
E1= [0 ; 0];

%2 etapa da modelagem:

A2= [0 -1/L 
    1/C -1/(R*C)];
B2= [1/L
    0];
C2= [1 0 ; 0 1];
E2= [0 ; 0];

%Matrizes Médias

A= D*A1+(1-D)*A2;
B=D*B1+(1-D)*B2;
C=D*C1+(1-D)*C2;
E=D*E1+(1-D)*E2;

%Valores em Regime permanente

U = Vg;

Xb= -inv(A)*B*U;

Yb = (-C*inv(A)*B+E)*U;

% Modelo padrao no matlab para representar espaço de estados:

Ab = A;
Bb =[B ((A1-A2)*Xb+(B1-B2)*U)];
Cb= C;
Eb = [E ((C1-C2)*Xb+(E1-E2)*U)];
