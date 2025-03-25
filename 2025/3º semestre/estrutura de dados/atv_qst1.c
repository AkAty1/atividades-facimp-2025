#include <stdio.h>

#define TAM 3

typedef struct {
    int matricula;
    char nome[50];
    float nota;
} Aluno;

void cadastrarAluno(Aluno *a) {
    printf("Matricula: ");
    scanf("%d", &a->matricula);
    getchar();
    printf("Nome: ");
    fgets(a->nome, 50, stdin);
    printf("Nota: ");
    scanf("%f", &a->nota);
}

void exibirAluno(Aluno a) {
    printf("\nMatricula: %d\n", a.matricula);
    printf("Nome: %s", a.nome);
    printf("Nota: %.2f\n", a.nota);
}

int main() {
    Aluno alunos[TAM];
    
    for (int i = 0; i < TAM; i++) {
        printf("\nCadastro do aluno %d:\n", i + 1);
        cadastrarAluno(&alunos[i]);
    }

    printf("\nDados dos alunos cadastrados:\n");
    for (int i = 0; i < TAM; i++) {
        exibirAluno(alunos[i]);
    }
    
    return 0;
}
