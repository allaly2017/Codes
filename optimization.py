#!/usr/bin/env python3
# -*- coding: utf-8 -*-


# Author : Konan ALLALY
#

import numpy as np

def J(v,Q,c,b):
    Qv = np.einsum('ij,j',Q,v)
    return(0.5*np.einsum('i,i', Qv,v)- np.einsum('i,i',b,v) + c)

def ConjugateGradient(A,b,tol):
    n = np.size(b)
    x = np.zeros((n))
    r0 = b - np.einsum('ij,j', A,x) # r0 = -grad(J(x)) = b-A*x0
    print("R0------------->",r0)
    p0 = r0
    k=0
    print("Borm de depart --------->",np.einsum('i,i', r0,r0)) #tol ----> <r0,r0> = r0'*r0
    while(np.einsum('i,i', r0,r0) > tol):
        A0 = np.einsum('ij,j', A,p0)                            # Matrixial product A*p0
        alpha = np.einsum('i,i',r0,r0)/np.einsum('i,i', A0,A0)
        x = x + alpha*p0
        print("Solution---------->", J(x,A,c,b))
        #np.save("J-",J(x,A,c,b))
        print("x -------->",x)
        print(x)
        r1 =  r0 - alpha*np.einsum('ij,j', A,p0)
        print("k----------->", k)
        print("r1 ---------->",r1)
        print("norme(r0)---------->", np.einsum('i,i', r0,r0))
        beta = np.einsum('i,i', r1,r1)/np.einsum('i,i', r0,r0)
        p1 = r1 + beta*p0
        r0 = r1
        p0 = p1
        k = k+1
        if(k==21):
            break
        if(k>10000):
            print("It haven't convergence")
            print(np.einsum('i,i', r0,r0))
            break
    return(x, J(x,A,c,b))

c = 1./3

M = 2
A = np.zeros((M,M))
b = np.zeros((M))

for i in range(M):
    b[i] = 4./(3+2*i+2)
    for j in range(M):
        if(i==j):
            A[i,j]=1./(i+1)
        else:
            A[i,j] = 2./(i+j+2)

#print(A)
#print(b)
print(ConjugateGradient(A,b,10^(-15)))
