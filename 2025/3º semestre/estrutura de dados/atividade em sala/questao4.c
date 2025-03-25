#include <stdio.h>

#define TAM 3

typedef struct {
    int dia;
    int mes;
    int ano;
} Data;

typedef struct {
    char descricao[100];
    Data data;
} Evento;

void cadastrarEvento(Evento *e) {
    printf("Descricao: ");
    getchar();
    fgets(e->descricao, 100, stdin);
    printf("Dia: ");
    scanf("%d", &e->data.dia);
    printf("Mes: ");
    scanf("%d", &e->data.mes);
    printf("Ano: ");
    scanf("%d", &e->data.ano);
}

void exibirEventos(Evento eventos[], int tamanho) {
    printf("\n%-30s %-10s\n", "Descricao", "Data");
    printf("------------------------------------------------\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%-30s %02d/%02d/%04d\n", eventos[i].descricao, eventos[i].data.dia, eventos[i].data.mes, eventos[i].data.ano);
    }
}

int main() {
    Evento eventos[TAM];
    
    for (int i = 0; i < TAM; i++) {
        printf("\nCadastro do evento %d:\n", i + 1);
        cadastrarEvento(&eventos[i]);
    }

    printf("\nEventos cadastrados:\n");
    exibirEventos(eventos, TAM);
    
    return 0;
}
