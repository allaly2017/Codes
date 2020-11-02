# -*- coding:utf8 -*


 """ Dans ce TP nous ecrivons deux fonctions qui permettent
 de chiffrer et déchiffrer une lettre majuscule par la méthode de substitution
 monoalphabétique de César. Ces deux fonctions sont réutilisées pour chiffrer
 ou déchiffrer des chaînes de caractères.
 On les réutilsent aussi pour réaliser la méthode de viginère qui pour elle,
 la clé peut être une chaîne de caractère"""

# Exercice 1

# Fonction 1

""" Dans cette fonction, La clé est un caractère entre A-Z
La clé donnée par char1, et le mot à chiffrer char2
Je calcule la distance entre le code ASCII de la clé et celle de A,
cette différence va servir de clef pour le chiffrement.
Cependant vu que les majuscules sont de 65 pour A à 90 pour Z,
On fait un traitement paticulier. Quand celle ci n'est pas 25
on considère le cas où la somme de la clef et le code de la lettre à chiffrer
est inférieure ou égale à celle de Z, on utilise la somme pour trouver la
lettre chiffré, dans l'autre cas on fait une sorte de congruence pour revenir
au départ """

def cesarLeter(char1, char2):
	cle = ord(char1)-ord("A")
	if cle==25:
		if char2=="A":
			return("Z")
		else:
			return(chr(ord(char2)-1))
	elif (ord(char2)+cle) <= ord("Z"):
		return(chr(ord(char2)+cle))
	else:
		return(chr(((ord(char2)+cle)-ord("Z"))+ord("A")-1))

#print(cesarLeter("D", "B"))
#print(cesarLeter("D", "C"))
#print(cesarLeter("Z", "C"))

#print("B -->", cesarLeter("D", "B"))
#print("C -->", cesarLeter("D", "C"))
#print("C -->", cesarLeter("Z", "C"))
#for i in range(ord("A"),ord("Z")):     J'affiche tous les caractère et leur chiffement pour une clef deonné
#	print(chr(i), "--->", cesarLeter("Z", chr(i)))

""" J'utilise la fonction précédente pour faire le chiffrement """

def cesar(char1, s):
	texte_crypte = ""
	for i in range(len(s)):
		texte_crypte = texte_crypte + cesarLeter(char1, s[i])
	return texte_crypte

#print(cesar("D", "BONJOUR"))
#print("BONJOUR --> ", cesar("D", "BONJOUR"))


#def deCesarLeter(char1, char2):
#	cle = ord(char1)-ord("A")
#	if cle==25:
#		cle = -1
#	return chr(ord(char2)-cle)


def deCesarLeter(char1, char2):
	cle = ord(char1)-ord("A")
	if cle==25:
		if char2=="Z":
			return("A")
		else:
			return(chr(ord(char2)+1))
	elif (ord(char2)-cle) >= ord("A"):
		return(chr(ord(char2)-cle))
	else:
		return(chr(1+ord("Z")-(ord("A")-(ord(char2)-cle))))

#print(deCesarLeter("D", "E"))
#print(deCesarLeter("D", "F"))
#print(deCesarLeter("Z", "B"))

#print(deCesarLeter("H", "I"))
#print(deCesarLeter("I", "W"))
#print(deCesarLeter("H", "U"))
#print(deCesarLeter("I", "R"))
#print(deCesarLeter("H", "V"))
#print(deCesarLeter("I", "C"))
#print(deCesarLeter("H", "Y"))

def deCesar(char1, s):
	texte_decrypte = ""
	for i in range(len(s)):
		texte_decrypte = texte_decrypte + deCesarLeter(char1, s[i])
	return texte_decrypte

#print(deCesar("D", "ERQMRXU"))



def viginere(char1, s):
	message_chiffre = ""
	for i in range(len(s)):
		message_chiffre = message_chiffre + cesarLeter(char1[i%len(char1)], s[i])
	return message_chiffre

#print(viginere("HI", "BONJOUR"))

def Deviginere(char1, s):
	message_dechiffre = ""
	for i in range(len(s)):
		message_dechiffre = message_dechiffre + deCesarLeter(char1[i%len(char1)], s[i])
	return message_dechiffre

#print(Deviginere("HI", "IWURVCY"))
