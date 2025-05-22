#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int id;
    char nome[50];
    float preco;
} Produto;

int main() {
    Produto *produtos = (Produto *)malloc(5 * sizeof(Produto));

    for (int i = 0; i < 5; i++) {
        printf("Produto %d\n", i + 1);
        printf("ID: ");
        scanf("%d", &(produtos + i)->id);
        printf("Nome: ");
        scanf(" %[^\n]", (produtos + i)->nome);
        printf("Preco: ");
        scanf("%f", &(produtos + i)->preco);
    }

    printf("\nLista de Produtos:\n");
    for (int i = 0; i < 5; i++) {
        printf("ID: %d, Nome: %s, Preco: %.2f\n", (produtos + i)->id, (produtos + i)->nome, (produtos + i)->preco);
    }

    free(produtos);
    return 0;
}