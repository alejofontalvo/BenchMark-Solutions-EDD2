using System;
using System.IO;
using System.Numerics; // Necesario para BigInteger
using System.Diagnostics; // Necesario para Stopwatch

namespace SumaFibonacci
{
    class Program
    {
        static void Main(string[] args)
        {
            // Iniciamos un cronómetro
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            BigInteger f0 = 0;   // Fibonacci(0)
            BigInteger f1 = 1;   // Fibonacci(1)
            BigInteger suma = 0; // Acumulador para la suma

            // Iteramos 10.000 veces
            for (int i = 0; i < 10_000; i++)
            {
                // Sumamos el término actual de la serie
                suma += f0;

                // Calculamos el siguiente número de Fibonacci
                BigInteger siguiente = f0 + f1;
                f0 = f1;
                f1 = siguiente;
            }

            // Detenemos el cronómetro
            stopwatch.Stop();
            long tiempoTranscurridoMs = stopwatch.ElapsedMilliseconds;

            // Mostramos en consola
            Console.WriteLine($"La suma de los primeros 10,000 números de Fibonacci es: {suma}");
            Console.WriteLine($"Tiempo transcurrido: {tiempoTranscurridoMs} ms");

            // Escribimos los resultados en un archivo de texto
            string rutaArchivo = "output.txt";
            using (StreamWriter writer = new StreamWriter(rutaArchivo))
            {
                writer.WriteLine($"La suma de los primeros 10,000 números de Fibonacci es: {suma}");
                writer.WriteLine($"Tiempo transcurrido: {tiempoTranscurridoMs} ms");
            }

            Console.WriteLine($"\nResultados guardados en el archivo '{rutaArchivo}'.");
            Console.ReadLine(); // Para pausar la consola antes de cerrar
        }
    }
}
