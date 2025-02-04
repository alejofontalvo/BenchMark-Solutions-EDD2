import java.math.BigInteger;
import java.io.FileWriter;
import java.io.IOException;

public class solve {

    public static BigInteger sumaFibonacci(int n) {
        BigInteger a = BigInteger.ZERO; // F(0)
        BigInteger b = BigInteger.ONE; // F(1)
        BigInteger total = BigInteger.ZERO;

        for (int i = 0; i < n; i++) {
            total = total.add(a);
            BigInteger temp = a;
            a = b;
            b = b.add(temp);
        }

        return total;
    }

    public static void main(String[] args) {
        int n = 10000;
        long startTime = System.currentTimeMillis();
        BigInteger resultado = sumaFibonacci(n);
        long endTime = System.currentTimeMillis();
        long tiempoEjecucion = endTime - startTime;

        // Imprimimos en consola
        System.out.println("La suma de los primeros " + n + " términos de Fibonacci es: " + resultado);
        System.out.println("Tiempo de ejecución: " + tiempoEjecucion + " ms");

        // Escribimos los resultados en un archivo de texto
        try (FileWriter writer = new FileWriter("output.txt")) {
            writer.write("La suma de los primeros " + n + " términos de Fibonacci es: " + resultado + "\n");
            writer.write("Tiempo de ejecución: " + tiempoEjecucion + " ms\n");
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo: " + e.getMessage());
        }
    }
}
