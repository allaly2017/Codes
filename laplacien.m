function laplacien()
clc; clear;  
 n=4;
 N=n*n;
 h=1/N;
 X=linspace(-1,1,N);
 Y=linspace(-1,1,N);
 
         
 
%Remplissage de la Matrice 
 U=zeros(N,N);
 
 for i=1:N
     U(i,1)=1;
     U(1,i)=1;
     U(N,i)=1;
     U(i,N)=1;
 end
 
 for i=2:N-1
     for j=2:N-1
         U(i,j)=((1\4)*h^2)*(U(i-1,j-1)+U(i-1,j+1)+U(i+1,j-1)+U(i+1,j+1));
     end
 end
 
 %pcolor(X, Y, U);
 %mesh(X, Y, U);
 %surf(X, Y, U);
 contourf(X,Y,U);
 %axis off; axis equal;
 end
