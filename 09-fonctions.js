async function asyncTest() {
	return 42;
}

console.log( asyncTest() );
console.log( await asyncTest() );

// Pourquoi doit-on utiliser await ?
// On utilise await pour marquer une pause jusqu'à ce que 
// la fonction asynchrone soit réalisée.

function count() {
	return [1,2,3,4,5];
}

for(let elem of count() )
	console.log(elem);

// Créez un générateur genCount équivalant à count()
// puis parcourez le résultat.
//for(...)
//	console.log(...)

// Créez un générateur asynchrone asyncGenCount équivalant à count()
// puis parcourez le résultat.
//for await (...)
//	console.log(...)