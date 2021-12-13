let array = [1,2,3,4,5,-1];

// Utilisez filter pour retourner tous les éléments > 2.
function SuperieuraDeux(element){
	return element > 2;
}
console.log(array.filter(SuperieuraDeux));

// Ou encore
console.log(array.filter(element => element>2 ))


// Est-ce que array contient un élément > 4 ?
console.log(array.filter(element => element>4 ))

// Est-ce que tous les éléments de array sont positifs ?
console.log(array.filter(element => element>=0 ))


// Construisez un nouveau tableau à partir de array qui contient les
// valeur absolus des valeurs de array.
console.log(array.filter(element => Math.abs(element)));

let a = -12.5
console.log(Math.abs(a))

// Utilisez Array.from pour construire un tableau à 5 éléments contenant
// les 5 premiers multiples de 3.
console.log(Array.from([1,2,3,4,5], x => 3*x));