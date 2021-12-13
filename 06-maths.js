let str = '2';

// convertissez str en un Number.
str = Number(str)
console.log(str)
// Pourquoi ne faut-il pas utiliser parseInt() ou parseFloat() ?
// parseInt renvoie un entier correspondant à la chaîne de caractère
// et à la base entrée en paramètre 
// Exemple : parseInt("1100", 2) -----> 12
console.log(parseInt("1100",2))
// parseFloat permet de transformer une chaîne de caractère en un nombre flottant

let i = 5.4;
let j = -5.4;
console.log(Math.trunc(i), Math.floor(i), Math.round(i), Math.ceil(i));
console.log(Math.trunc(j), Math.floor(j), Math.round(j), Math.ceil(j));
// Quelles sont les différences entre truncate, floor, round, et ceil ?
// truncate fourni la troncature
// floor four évalue un nombre décimal et retourne le plus grand nombre entier inférieur ou égal au nombre évalué.
// round retourne le nombre entier le plus proche d'un nombre donné.
// ceil retourne le plus petit entier supérieur ou égal au nombre donné.

console.log( Math.abs(i), Math.sign(i) );
console.log( Math.abs(j), Math.sign(j) );
console.log( Math.abs(0), Math.sign(0) );
// que font les fonctions abs et sign ?
// abs donne la valeur absolue
// sign retourne le signe d'une variable 

let array = [5,6,7,8,-1,2];
// Avec Math.min et Math.max, calculez le minimum et maximum de array :
console.log(Math.min(array), Math.max(array));


// Utilisez toString pour convertir i en hexadecimal.
console.log(i.toString())

// Utilisez toString et padStart pour convertir i en hexadecimal
// avec 8 chiffres.
//console.log('i'.padStart(8))
//console.log(i.padStart(16))