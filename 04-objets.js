let obj = {a: 1, b: 2, c: 3};
console.log(obj)

// Ajoutez 2 à obj.a
obj.a+=2
console.log(obj);

// Supprimez obj.c
delete(obj.c)
console.log(obj);

// Ajoutez un nouvel élément d à obj valant 4;
obj = {...obj, ...{d:4}}
console.log(obj)

let obj2 = {e: 5, f: 6};
// Fusionnez obj et obj2 en utilisant le spread operator ...
let fusion = {...obj, ...obj2};
console.log(fusion)

// Est-ce que obj contient la clé z (utilisez in) ?
//console.log(z in obj)