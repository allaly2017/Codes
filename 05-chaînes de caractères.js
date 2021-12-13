let str = 'abc';

// est-ce que str contient 'ab' (utilisez includes) ?
console.log(str.includes('ab'))

// est-ce que str commence par 'bc' ?
console.log(str.startsWith('ab'))

let str2='a,b,c';
// découpez str2 avec , comme séparateur.
console.log(str2.split(','))

// quel est l'index de 'c' dans str ?
console.log(str.indexOf('c'))

// retournez une sous-chaîne de str ne contenant pas
// le premier et le dernier élément avec slice().
// console.log(...)

// le deuxième élément de str.
// console.log(...)

// concatenez str et str2
console.log([].concat(str,str2))

let i = 5;
let str3 = '(' + i + ')';
// Réécrivez str3 en utilisant un littéral de gabari.
//STR3 = `$'(' + i + ')'`
console.log(str3)