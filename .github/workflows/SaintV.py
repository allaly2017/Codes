# -*-coding:utf-8 -*
import numpy as np
import scipy as sp
import matplotlib.pyplot as plt

def EquatTransp(a, b, T, W0, N, P):

# [a, b] intervalle en x
# T valeur de tps max
# c vitesse écoulement de l'eau
# W0 concentration de polluant t > x np.array de taille N_eqs x N
# N et P respectivement nb de valeur espace et temps

    N_eqs = np.size(W0,0)

    x = np.linspace(a+dx/2, b-dx/2, N)

    d = dt / dx

    # Verifier la condition CFL

    W = W0

    plt.plot(x, W[0,:], 'r-')
    plt.plot(x, W[1,:], 'b-')
    plt.ylim(0.,1.1)
    plt.title('t={0}'.format(0*dt))
    plt.show()

    # Boucle en temps
    for k in range(1, P):
        # Interface i=0 (bord gauche)
        F  = flux_LF(W0[:,0], W0[:,0])
        W[:, 0] = W[:, 0] + d*F

        # Boucle sur les interfaces i=1 à N-1
        for i in range(1, N-1):
            F = flux_LF(W0[:,i-1], W0[:,i])
            W[:, i-1] = W[:, i-1] - d*F
            W[:, i]   = W[:,i] + d*F

        # Interface i=0 (bord gauche)
        F = flux_LF(W0[:, N-1], W0[:,N-1])
        W[:, N-1] = W[:, N-1] - d*F

        W0 = W

        # if k%100==0:
        #     plt.plot(x, W[0,:], 'r-')
        #     plt.plot(x, W[1,:], 'b-')
        #     plt.ylim(0.,1.)
        #     plt.title('t={0}'.format(k*dt))
        #     plt.show()

        if k == 1:
            line1, = plt.plot(x, W[0,:])
            line2, = plt.plot(x, W[1,:])
        else:
            line1.set_ydata(W[0,:])
            line2.set_ydata(W[1,:])
        plt.pause(0.0001) # pause avec duree en secondes

    return W

def flux(u):
    """Flux pour l'equation de Saint Venant"""
    return np.array(( u[1], u [1]*u[0] + 0.5*g*u[0]**2))

def flux_decentre_amont(ug,ud):
    return max(c,0)*ug + min(c,0)*ud

def flux_centre(ug,ud):
    return 0.5*(flux(ug)+flux(ud))

def flux_LF(ug,ud):
    return 0.5*(flux(ug)+flux(ud)) - 0.5*dx/dt*(ud-ug)

a = 0.0
b = 1.
T = 1.0
g = 9.81

N = 100
P = 1000 # augmenter pas de tps

dx = (b - a) / N
dt = T / P

W0 = np.zeros((2,N))
W0[0,0:N/10] = 1. # hauteur "à gauche"

W = EquatTransp(a, b, T, W0, N, P)
