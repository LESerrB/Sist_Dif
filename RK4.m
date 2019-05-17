clc;                                               % Clears the screen
clear all;
%% Initial Values
fprintf("Runge-Kutta 4° Orden\n")
F_xy = input('Ec. Diferencial: ', 's');
x0 = input('x Inicial = ');                         % Initial value of x
y0 = input('y Inicial = ');                         % Initial value of y
xF = input('x Final = ');                           % Final value of x
n = input('Iteraciones: ');                         % Number of cells for xx matrix
h = (xF-x0)/n;                                      % Delta x

xx = x0:h:xF
yy = zeros(1,length(xx));

yy(1) = y0;
%%  Calculation Loop
for i=1:(length(xx)-1)
    x = xx(i);
    y = yy(i);
    K1 = eval(F_xy);

    x = xx(i)+(h/2);
    y = yy(i)+(K1*h/2);
    K2 = eval(F_xy);

    y = yy(i)+(K2*h/2);
    K3 = eval(F_xy);

    x = xx(i)+h;
    y = yy(i)+(K3*h);
    K4 = eval(F_xy);

    yy(i+1) = yy(i)+(h/6)*(K1+2*K2+2*K3+K4);              % Main Ecuation
end
%% Displaying Final Values
plot(xx,yy, '-o')
grid on