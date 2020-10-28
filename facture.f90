! Pour la complilation il faut faire  " gfortran facture.f90 -O facture "
! Et pour afficher la réponse il faut ensuite faire " ./facture"

program facturation_avec_remise
implicit none
real, parameter :: taux_tva = 17.6
real :: ht, ttc, net, tauxr, remise

print *, 'donnez le prix hors taxes'
read *, ht

ttc = ht * (1. + taux_tva/100.)
if (ttc < 1000.) then
  tauxr = 0.
else
  if (ttc < 2000.) then
    tauxr = 1.
  else
    if (ttc < 5000.) then
      tauxr = 3.
    else
      tauxr = 5.
    endif
  endif
endif

remise = ttc * tauxr/100.
net = ttc - remise
print *, 'prix ttc :  ', ttc
print *, 'remise :    ', remise
print *, 'net a payer : ', net

end
