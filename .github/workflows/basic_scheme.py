# -*-coding:utf-8 -*
import numpy as np
import scipy as sp
import math as m
import fct
import matplotlib.pyplot as plt
import sys

import time
import random

T = 0.001
NT = 11


d = fct.d
Lx = fct.Lx
N = fct.N
mu = fct.mu
Lambda = fct.Lambda
sigma_y = fct.sigma_y
mu0 = fct.mu0
Lambda0 = fct.Lambda0
tf_gamma0 = fct.tf_gamma0


# boundary conditions
strain_macro = np.zeros((d,d))
strain_macro[0,0] = 0.001
#strain_macro[1,0] = 0.001
# boundary conditions
#strain_macro_A = 0.0001*np.array([[[[1,0],[0,0]],[[0,0.5],[0.5,0]]],[[[0,0.5],[0.5,0]], [[0,0],[0,1]]]])
#T = 0.001
#NT = 11
#dt = T/(NT-1)
#t = np.linspace(0,T,NT)
#if(len(sys.argv) > 1):
#	strain_macro = np.load(sys.argv[1])
#	print(strain_macro)
#else:
#	strain_macro = np.zeros((NT,d,d))
#	strain_macro[:,0,1] = np.linspace(0,T,NT)
#	strain_macro[:,1,0] = strain_macro[:,0,1]
#print(strain_macro[NT-1,:,:])



# variables
strain = np.zeros(np.concatenate((N,d,d),axis=None))

#contrainte à la première iteration
stress = np.zeros(np.concatenate((N,d,d),axis=None))
for ix in range(0,N[0]):
	for iy in range(0,N[1]):
		stress[ix,iy,:,:] = fct.compute_behaviour_elastic(mu[ix,iy], Lambda[ix,iy], strain[ix,iy,:,:])

# algorithm
residual = 1
iteration = 0
while residual > 1e-6:

	#compute polarization stress
	tau = np.zeros(np.concatenate((N,d,d),axis=None))
	for ix in range(0,N[0]):
		for iy in range(0,N[1]):
			tau[ix,iy,:,:] = stress[ix,iy,:,:] - fct.compute_behaviour_elastic(mu0, Lambda0, strain[ix,iy,:,:])

	#calcul de epsilon a l'etape suivante
	tf_tau = np.fft.fftshift(np.fft.fftn(np.fft.ifftshift(tau, axes=range(0,d)), s=N, axes=range(0,d)), axes=range(0,d))
	tf_gamma0_tau = np.zeros(np.concatenate((N,d,d),axis=None),dtype=np.complex)

	#produit doublement contracté tf_gamma0 : tf_tau
	tf_gamma0_tau = np.einsum('...ijkl,...kl->...ij', tf_gamma0,tf_tau)

	strain_new = strain_macro - np.real(np.fft.fftshift(np.fft.ifftn(np.fft.ifftshift(tf_gamma0_tau, axes=range(0,d)), s=N, axes=range(0,d)), axes=range(0,d)))
	#strain_new = strain_macro[NT-1,:,:] - np.real(np.fft.fftshift(np.fft.ifftn(np.fft.ifftshift(tf_gamma0_tau, axes=range(0,d)), s=N, axes=range(0,d)), axes=range(0,d)))

	#compute residual
	residual = np.linalg.norm(strain_new-strain)
	strain = strain_new

	# update strain
	for ix in range(0,N[0]):
		for iy in range(0,N[1]):
			stress[ix,iy,:,:] = fct.compute_behaviour_elastic(mu[ix,iy], Lambda[ix,iy], strain[ix,iy,:,:])
	#print("Iteration %ld" % iteration)
	#print("Residual %.8e" % residual)
	iteration = iteration + 1       #compter le nombre d'iteration

#print(strain_macro)

#for ix in range(0,d):
#	for iy in range(0,d):
#		plt.imshow(strain[:,:,ix,iy], interpolation='none', origin='lower')
#		plt.colorbar()
#		plt.show()
		#plt.plot(np.linspace(0, 1e-20, 4), strain[:,:,ix,iy].mean())

m = np.zeros(N)
for ix in range(0,N[0]):
	for iy in range(0,N[1]):
		#print(np.mean(stress[0,0,...]))
		m[ix,iy] = np.mean(strain[ix,iy,...])
		mix = m.reshape(N[0]*N[1])
plt.plot(mix)
plt.show()

#print(iteration)
#print(time.perf_counter())
