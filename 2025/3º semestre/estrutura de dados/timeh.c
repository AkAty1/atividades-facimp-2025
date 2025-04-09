#include <stdio.h>
#include <time.h>

int main() {
    clock_t inicio, fim;
    double tempo_gasto;

    inicio = clock();

    // Código que você quer medir
    for (long i = 0; i < 100000000; i++) {
        // Simulando um processo
    }

    fim = clock();

    tempo_gasto = ((double)(fim - inicio)) / CLOCKS_PER_SEC;

    printf("Tempo de execução: %.2f segundos\n", tempo_gasto);

    return 0;
}
