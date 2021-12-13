function volumes_finis()

clear all; clc;

a=-1;
b=1;
%cfl = 0.5;

N = 200;

dx = (b-a)/N;
c = 0.5; 
dt = 0.01;
x = linspace(a,b,N);


U = zeros(1,N);
U_c = zeros(1,N);
U_e = zeros(1,N); 
U_W = zeros(1,N);
U_fr = zeros(1,N);

U_eno3 = zeros(1,N);
U_eno4 = zeros(1,N);
U_eno5 = zeros(1,N);

err3 = zeros(1,N);
err4 = zeros(1,N);
err5 = zeros(1,N);



%

%}


%{Solution initial gaussienne
for i=1:N
    U(i) = exp(-5*x(i)^2);
end



%Calcul de la solution exacte gaussienne
for i=1:N
    U_e(i) = exp(-5*(x(i)-c*dt)^2);
end
%}


%{ Solution initial discontinue
for i=1:N
    if (x(i)>=-1) & (x(i)<-0.5)
        U(i)=2*x(i)+2-(sin(3*pi*(x(i)-0.5)))/6;
    else if (x(i)>=-0.5) & (x(i)<1/6)
            U(i)=0.5*sin(1.5*pi*(x(i)-0.5)^2);
        else U(i)=0;
        end
    end
end
%}



%{Solution type sinus
for i=1:N
    U(i) = sin(pi*x(i));
end

for i=1:N
    U_e(i) = sin(pi*(x(i)-c*dt));
end    
%}



%Solution initiale discontinue
for i=1:N
   if (x(i)<=-0.25)
      U(i)=0.75;
   else if ((x(i)>-0.25) & (x(i)<=0.25))
           U(i) = 2;
        else if (x(i)>0.25)
                U(i) = 0.25;
             end   
        end
   end
end


    
%Schema décentrer à droite
U_c(1)= U(1) - c*(dt/dx)*(U(1)-U(N));
for i=2:N
    U_c(i)= U(i)-c*(dt/dx)*(U(i)-U(i-1));
end





%Schema de Lax friedrich
U_fr(1)=U(1);
U_fr(N)=U(N);
for i=2:N-1
    U_fr(i) = 0.5*(U(i+1)+U(i-1))-c*(dt/(2*dx))*(U(i+1)-U(i-1));
end


   
%Schema de Lax Wendroff
U_W(1) = 0;%U(1);
U_W(N) = 0;%U(N);
for i=2:N-1
    U_W(i) = U(i)-c*dt/(2*dx)*(U(i+1)+U(i-1))+c*c*((dt)^2)/2*((dx)^2)*(U(i+1)+U(i-1)-2*U(i));
end
    
    
    
    
%Schema Eno ordre 3 
U_eno3(1)=0;%U(1);
U_eno3(2)=U(2);
U_eno3(N)=0;%U(N);

for i=3:N-1
    U_eno3(i) = U(i)-c*dt*(1/dx)*((1/6)*U(i-2)-U(i-1)+(1/2)*U(i)+(1/3)*U(i+1)); 
end   

%Schema Eno ordre 4
U_eno4(1)=0;%U(1);
U_eno4(2)=U(2);
U_eno4(N-1)=U(N-1);
U_eno4(N)=0;%U(N);
for i=3:N-2
    U_eno4(i) = U(i)-c*dt*(1/dx)*((1/12)*U(i-2)-(2/3)*U(i-1)+(2/3)*U(i+1)-(1/12)*U(i+2));
end

%Schema Eno ordre 5

U_eno5(1)=0;%U(1);
U_eno5(2)=U(2);
U_eno5(N-2)=U(N-2);
U_eno5(N-1)=U(N-1);
U_eno5(N)=0;%U(N);
for i=3:N-3
    U_eno5(i) = U(i)-c*dt*(1/dx)*((1/20)*U(i-2)-(1/2)*U(i-1)-(2/3)*U(i)+U(i+1)-(1/4)*U(i+2)+(1/30)*U(i+3));
end


for i=1:N
err3(i) = U_e(i) - U_eno3(i);
err4(i) = U_e(i) - U_eno4(i);
err5(i) = U_e(i) - U_eno5(i);
end

plot(x,U_eno3, x,U_eno4, x,U_eno5)
legend('eno ordre 3', 'eno ordre 4', 'eno ordre 5') 





end