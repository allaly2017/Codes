function test_equat_chal()
clc; clear;  
  
n = 4; 
N = n*n; 
h = 1/N;
x =0:h:1; %Notre domaine est (0,1) x (0,1)
y =0:h:1;
 
%Début remplissage de la matrice A
A = zeros(N);
 for i = 1:(N-1)
   A(i,i) = -4;
   A(i+1,i) = 1;
   A(i,i+1) = 1;
   if (mod(i,n) == 0)
     A(i,i+1) = 0;
     A(i+1,i) = 0;
   end
 end
 
 for i=1:(N-n)
   A((n+i),i)=1;
   A(i,(n+i))=1;
 end
 
 A(N,N)=-4;
 A=A/(h^2); 
 
%Fin remplissage de la matrice A



 
%Fonction Matlab définissant la Solution exacte
function z = U_ex(a,b)
  z = a*b*((a-1)^3)*((b-1)^3);
end

%Fonction Matlab définissant le Second Membre f 
function t = f(c,d)
  t = 6*(1-(3*c)+2*(c^2))*((d-1)^3)*d + 6*(1-(3*d)+2*(d^2))*((c-1)^3)*c;
end

  
%Remplissassage du second membre dans le cas dela (u) = f, 
% avec des 0 aux bords et les valeurs de f aux autres points
k=1;
for i=1:n
  for j=1:n
  B(k)=f(x(i),y(i));
  if (mod(j,n)==0)
    B(k)=0;
  end
  k=k+1;
  end
end

%Remplissage du second membres sans conditions aux Limites
k=1;
for i=1:n
  for j=1:n
      C(k) = f(x(i),y(j));
      k=k+1;
  end
end


%Second membre avec des -1 partout
D = -ones(N);

%Second membre dans le cas Delta(u) = 0 avec conditions
%aux limites
E=zeros(N);
E(1)=-5;
E(N)=-5;



%résolution
%en fonction du cas on pourra utiliser
%les vecteurs B ou C ou D ou E
V = A\D';
 
%Transformation
%On transforme le vecteur V solution en une matrice U_(i,j)
k=1;
for i=1:n
  for j=1:n
    U(i,j)=V(k);
    k=k+1;
  end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%On utilisera cette partie dans le cas où
%l'on voudrait mettre des zeros sur le bords

%Decalage pour les conditions aux limites
%for j=n:-1:2
%  for i=n:-1:2
%    U(j,i)=U((j-1),(i-1));
%  end
%end

%Ici on met des zéros à tous les U(i,j) qui sont aux bords
%for i=1:n
%  for j=1:n
%    U(1,i)=0;
%    U(j,1)=0;
%    U(n+1,i)=0;
%    U(j,n+1)=0;
%  end
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


%Calcul de l'erreur

%erreur absolue
err_abs = zeros(n);
for i=1:n
  for j=1:n
    err_abs(i,j) = U_ex(x(i),y(j)) - U(i,j);
  end
end

%err relative
err_rel = sum(sum(((err_abs).^2)))*(1/(N^2));

 

contourf(x,y,U);
axis off; axis equal
end