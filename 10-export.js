function foo() {
	console.log('foo');
}

// export la fonction foo.

console.log(import.meta);
// Utilisez URL pour obtenir la partie 'search' de import.meta.
//console.log(...)

// Utilisez URLSearchParams pour extraire les paramètres transmis.