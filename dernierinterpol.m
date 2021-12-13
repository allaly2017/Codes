function dernierinterpol()

N=100;
x=linspace(0,2,N);
y=linspace(0.5,2,N);

V = zeros(N,1);
W = zeros(N,1);
V_chap = zeros(N,1);
W_chap = zeros(N,1);
O = zeros(2,2);
I = eye(N);
Z = zeros(N,N);
Z_theta = zeros(N,N);

for i = 1 : N
    W(i) = x(i);
end

for i = 1 : N
    V(i) = -0.1*x(i)+1;
end

W_chap = W/norm(W);
V_chap = (V - (V'*W)*(W/((norm(W))^2)))/norm((V - (V'*W)*(W/((norm(W))^2))));

ctheta = (W'*V)/(norm(V)*norm(W));
stheta = sqrt(1-(ctheta)^2);

O = [ ctheta, -stheta; stheta, ctheta ];

M = [V_chap' ; W_chap'];
P = M'*M;
I = eye(N);

for i = 1 : N
    for j=1:N
        Z(i,j) = exp(-y(j)*x(i));
    end
end

Z_theta = (I-P)*Z + (M'*(O*(M*Z)));

%ctheta
%plot(x,Z, x,Z_theta)
%W_chap'*V_chap
contourf(x,y,Z, x,y,Z_theta)
end
