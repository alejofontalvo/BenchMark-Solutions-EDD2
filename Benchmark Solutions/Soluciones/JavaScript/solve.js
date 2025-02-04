const fs = require('fs');

function sumFibonacci(n) {
  let a = 0n;   // Usamos BigInt con el sufijo 'n'
  let b = 1n;
  let total = 0n;

  for (let i = 0; i < n; i++) {
    total += a;
    const temp = a;
    a = b;
    b = b + temp;
  }

  return total;
}

// Definimos el número de términos
const n = 10000;

// Iniciamos el temporizador
const startTime = Date.now();

// Calculamos la suma
const resultado = sumFibonacci(n);

// Obtenemos el tiempo transcurrido
const endTime = Date.now();
const tiempoTranscurrido = endTime - startTime;

// Mostramos la información en consola
console.log(`La suma de los primeros ${n} términos de Fibonacci es:\n${resultado.toString()}`);
console.log(`Tiempo transcurrido: ${tiempoTranscurrido} ms`);

// Preparamos el contenido del archivo
const contenidoArchivo = 
`La suma de los primeros ${n} términos de Fibonacci es: ${resultado.toString()}
Tiempo transcurrido: ${tiempoTranscurrido} ms`;

// Escribimos el contenido en un archivo .txt
fs.writeFileSync('output.txt', contenidoArchivo);

console.log('El resultado se ha guardado en resultado.txt');
