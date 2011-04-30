#! /bin/octave -qf
clear all
close all

%UhodI
I = [0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10];
I = I.*0.001;       %na ampery
U1 = [0.0008,0.0016,0.0025,0.0033,0.0040,0.0049,0.0056,0.0063,0.0072,0.0079,0.0087,0.0094,0.0100,0.0107,0.0114,0.0121,0.0128,0.0134,0.0141,0.0147];
eU1 = [0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002,0.0002];
eI = [0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08,0.08];
eI = eI.*0.001;     %na ampery
errorbar(I,U1,eI,eU1,"~>")
hold on
coefUhodI = polyfit(I,U1,1);
UhodI = coefUhodI(1).*I + coefUhodI(2);
plot(I,UhodI,'r;U = 1.46*I + 3.9*10^{-4} liniowa aproksymacja;')
grid;
grid
xlabel("I [A]")
ylabel("U_h[V]")
print -deps /home/demoon/UhodI.eps
close all

%gamma1
IsB = I.*0.4406;
coefgam1 = polyfit(IsB,U1,1);
gam1 = coefgam1(1).*IsB + coefgam1(2);
plot(IsB,U1,'+', IsB,gam1,'r;U = 3.32*I*B + 3.90*10^{-4};')
xlabel("I_s * B[A*T]")
ylabel("U_H[V]")
print -deps /home/demoon/gamma2.eps
close all

%UhodB2

B2 = [68.8, 102.6, 136.4, 170.2, 204.0, 237.8, 271.6, 305.4, 339.2, 373.0, 406.8, 440.6, 474.4, 508.2];
B2 = B2.*0.001;       %zamiana na ampery
B2odI = B2.*0.010; %na ampery
eB2 = [28,28,28,28,28,28,28,28,28,28,28,28,28,28];
eB2 = eB2.*(0.001)^4;     %na ampery

U2 = [0.0201, 0.0308, 0.0462, 0.0564, 0.0660, 0.0742, 0.0829, 0.0942, 0.1015, 0.1126, 0.1188, 0.1304, 0.1372, 0.1442];
eU2 = 0.05/100.*U2 + 0.01/100 ;
errorbar(B2,U2,eB2,eU2,"~>");
hold on
coefU2odB2 = polyfit(B2,U2,1);
prosta = coefU2odB2(1).*B2 + coefU2odB2(2);
plot(B2, prosta, 'r;U = 0.28*B + 0.01 liniowa aproksymacja;');
grid
grid
xlabel("B[T]");
ylabel("U[V]");
print -deps /home/demoon/UhodB.eps
close all  

%gamma2
coeffs = polyfit(B2odI, U2, 1);
gamma2 = coeffs(1).*B2odI + coeffs(2);

errorbar(B2odI, U2, eB2, eU2,"~>")
hold on
plot(B2odI, gamma2,'r;U = 28.0 B*I_s liniowa aproksymacja;')
grid
xlabel("B * I_s [T * A]")
ylabel("U_h[V]")
print -deps /home/demoon/gamma.eps
%close all
