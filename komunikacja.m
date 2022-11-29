delete(instrfindall); % zamkniecie wszystkich polaczen szeregowych
clear all;
close all;
s = serialport('COM5', 115200, 'Parity', 'None');
s.configureTerminator("LF");
fopen(s); % otwarcie kanalu komunikacyjnego
Tp = 0.1; % czas z jakim probkuje regulator
y = []; % wektor wyjsc obiektu
u = []; % wektor wejsc (sterowan) obiektu
y(1:100) = -1000; % mikrokontroler zwraca tylko dodatnie wartosci, wiec kazde −1
% oznacza, ze nie otrzymalismy jeszcze wartosci o tym indeksie
while true
txt = s.readline(); % odczytanie z portu szeregowego
eval(char(txt')); % wykonajmy to co otrzymalismy
% y=[y;Y];
if(Y < -1000)
break;
end
end
y(2:100) = -1000; % ignorujemy wszystko co odczytalismy poza pierwszym elementem
while true
txt = s.readline(); % odczytanie z portu szeregowego
eval(char(txt')); % wykonajmy to co otrzymalismy
if(Y > -1000) % jesli najmniejszym elementem nie jest −1, to znaczy ze
break; % nie ma brakujacych elementow, a wiec dane sa gotowe
end
end

Tp = 0.1; % czas z jakim probkuje regulator
y = []; % wektor wyjsc obiektu
u = []; % wektor wejsc (sterowan) obiektu
while length(y)~=100 % zbieramy 100 pomiarow
txt = s.readline(); % odczytanie z portu szeregowego
% txt powinien zawiera´c Y=%4d;U=%4d;
% czyli np. Y=1234;U=3232;
eval(char(txt')); % wykonajmy to co otrzymalismy
y=[y;Y]; % powiekszamy wektor y o element Y
u=[u;U]; % powiekszamy wektor u o element U
end

figure; 

plot((0:(length(y)-1))*Tp,y); % wyswietlamy y w czasie
ylabel("y");

figure; 
plot((0:(length(u)-1))*Tp,u); % wyswietlamy u w czasie
ylabel("u");