%pid & dmc


%przygotowanie ogólne i pida



k_max = 449;
k_skok = 250;
k_start = 20;
Y_pp = 0.0;
U_pp = 0.0;
Z_pp = 0.0;
Z = zeros(k_max,1);
E=0;

y_zad = 1;  %(da się od 2 do 3 prawie)
Y_zad = zeros(k_max,1);
Y = zeros(k_max,1);

% U_max = 1.6;
% U_min = 0.6;
% DU_max = 0.1;

for k = 1:k_max
    if(k<=k_skok)
        Y_zad(k) = Y_pp;
    else
        Y_zad(k) = y_zad;
    end
end





%przygotowanie DMC

% nastawy:
% 200,200,200,1     e=8.47(brzydko, zbyt szybko skacze ster)
% 200,200,200,5     e=10.14(ładnie)
% 200,200,200,2     e=9.10(brzydko)
% 200,200,200,3     e=9.52(ok)
% 150,150,150,3     e=9.53
% 120,120,120,3     e=9.53(pojawiają się brzydkie odbicia)
% 150,20,20,3       e=9.57
% 150,10,10,3       e=10.72(za małe)
% 150,20,5,3        e=9.72
% 150,20,10,3        e=9.57(final)

D=50ssssssssss; %horyzont dynamiki
N=20; %horyzont predykcji
Nu=10; %horyzont sterowania
lambda=3; %lambda

DUP = zeros(D-1, 1);

%odp skok
s_odp(1:D)=S(1:D);
s_odp(D+1:10000)=s_odp(D);

%Mp
Mp = zeros(N, D-1);
for i=1:N
    for j=1:D-1
        Mp(i, j)=s_odp(i+j)-s_odp(j);
    end
end

%M
M = zeros(N, Nu);
for i=1:N
    for j=1:min(i, Nu)
        M(i, j)=s_odp(i-j+1);
    end
end

%lambda
LAMBDA = eye(Nu)*lambda;

%K
K=( (M'*M+LAMBDA)^-1 )*M';

Ke = sum(K(1,:)
Ku = K(1,:)*Mp

for sth 

