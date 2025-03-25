#include <stdio.h>
#include <stdlib.h>

#define TAM 4

typedef struct {
    char titulo[100];
    char autor[100];
    int ano;
} Livro;

void cadastrarLivros(Livro *livros, int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        printf("\nCadastro do livro %d:\n", i + 1);
        getchar();
        printf("Titulo: ");
        fgets((livros + i)->titulo, 100, stdin);
        printf("Autor: ");
        fgets((livros + i)->autor, 100, stdin);
        printf("Ano: ");
        scanf("%d", &(livros + i)->ano);
    }
}

void exibirLivros(Livro *livros, int tamanho) {
    printf("\n%-30s %-30s %-10s\n", "Titulo", "Autor", "Ano");
    printf("----------------------------------------------------------------------\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%-30s %-30s %-10d\n", (livros + i)->titulo, (livros + i)->autor, (livros + i)->ano);
    }
}

int main() {
    Livro *livros = (Livro *)malloc(TAM * sizeof(Livro));
    if (livros == NULL) {
        printf("Erro ao alocar memoria.\n");
        return 1;
    }
    
    cadastrarLivros(livros, TAM);
    printf("\nLivros cadastrados:\n");
    exibirLivros(livros, TAM);
    
    free(livros);
    return 0;
}
