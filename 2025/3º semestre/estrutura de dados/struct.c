#include <stdio.h>

typedef struct {
    int dia;
    int mes;
    int ano;
} Data;

typedef struct {
    char nome[50];
    Data data_nascimento; 
} Aluno;

int main() {

    Aluno alunos[2] = {
        {"Rubens Miguel", {13, 6, 1998}},
        {"Ana Wite", {14,6, 2002}}
    };

   
    for (int i = 0; i < 2; i++) {
        printf("Aluno: %s\n", alunos[i].nome);
        printf("Data de Nascimento: %02d/%02d/%d\n", 
                alunos[i].data_nascimento.dia, 
                alunos[i].data_nascimento.mes, 
                alunos[i].data_nascimento.ano);
        printf("\n");
    }

    return 0;
}
