let array = [1, 2, 3];

console.log(array)

// ajoutez 2 à la 2ème valeur de array.
array[1] = array[1] + 2;
console.log(array);


// Utilisez join() pour concaténer toutes les valeurs de array
// avec une virgule entre chaque éléments.
console.log(array.join(','))

// Est-ce que array contient la valeur 4 ?
console.log(array.includes(4)) // ------> True

// Ou encore
for(let i = 0; i<array.length; ++i)
	if(array[i] === 4)
		console.log("Le tableau contient 4")

// Quel est l'index de la valeur 1 dans array ?
console.log(array.indexOf(1))

// triez les valeurs de array
console.log(array.sort())

// créez un sous-tableau contenant tous les éléments de array
// à l'exception de la première valeur.
let sous_tableau_1 = array.shift()
console.log('nouveau tableau')
console.log(sous_tableau_1)

// créez un sous-tableau contenant tous les éléments de array
// à l'exception de la dernière valeur.
let sous_tableau_2 = array.unshift()
console.log('nouveau tableau')
console.log(sous_tableau_2)

// Ajoutez un élément à la fin de array.
array.push(10)
console.log(array)

// Ajoutez un élément au début de array.
array.unshift(14)
console.log(array)

// Retirez le premier élément de array
array.shift()
console.log(array)

// Retirez le dernier élément de array
array.pop()
console.log(array)

let array2 = [9, 8, 7];
// créez un tableau contenant les valeurs de array et de array2
// grâce à concat().
let new_array = [].concat(array, array2)
console.log(new_array)

// créez un tableau contenant les valeurs de array et de array2
// grâce au spread operator ...
let tab = [...array, ...array2]
console.log("tab = ", tab)






