
console.log( 1 && 2 );
console.log( 1 || 2 );
console.log( 1 ?? 2 );


console.log( 0 && 2 );
console.log( 0 || 2 );
console.log( 0 ?? 2 );

console.log( null && 2 );
console.log( null || 2 );
console.log( null ?? 2 );

// Quelles sont les différences entre &&, || et ?? ?
// && désigne "et logique"
// || désigne "ou logique"
// ?? retourne l'opérande de droite si celle de gauche est null ou indéfinie et celle de gauche sinon