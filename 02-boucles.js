let array = ['a', 'b', 'c'];
let obj = {a: 1, b: 2, c: 3};

console.log({array, obj});

console.log('=== for ===');

for(let i = 0; i < array.length; ++i)
	console.log(i, array[i]);

console.log('=== for in ===');

// Parcourez les clés du tableau array 

for(let i in array)
 		console.log(i, array[i]);

// Parcourez l'objet obj
for(let i = 0; i<obj.length; ++i)
	console.log(obj[i]);

console.log('=== for of ===');

// Parcourez les valeurs du tableau array 
for(let i of array)
	console.log(i);

// Parcourez les valeurs de l'objet obj 

//for(let i of Object.values(obj) )
//	console.log(i);
for(let k of Object.values(obj))
	console.log(k)


// Parcourez les entrées de l'objet obj


for( let [key, values] in Object.entries(obj) )
	console.log(`${key}: ${values}`)