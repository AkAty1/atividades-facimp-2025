#include <stdio.h>

#define TAM 3

typedef struct {
    char rua[50];
    int numero;
    char cidade[50];
} Endereco;

typedef struct {
    int id;
    char nome[50];
    float salario;
    Endereco endereco;
} Professor;

void cadastrarProfessor(Professor *p) {
    printf("ID: ");
    scanf("%d", &p->id);
    getchar();
    printf("Nome: ");
    fgets(p->nome, 50, stdin);
    printf("Salario: ");
    scanf("%f", &p->salario);
    getchar();
    printf("Rua: ");
    fgets(p->endereco.rua, 50, stdin);
    printf("Numero: ");
    scanf("%d", &p->endereco.numero);
    getchar();
    printf("Cidade: ");
    fgets(p->endereco.cidade, 50, stdin);
}

void exibirProfessor(Professor p) {
    printf("\nID: %d\n", p.id);
    printf("Nome: %s", p.nome);
    printf("Salario: %.2f\n", p.salario);
    printf("Endereco: %s, %d - %s", p.endereco.rua, p.endereco.numero, p.endereco.cidade);
}

int main() {
    Professor professor;
    printf("\nCadastro do professor:\n");
    cadastrarProfessor(&professor);
    
    printf("\nDados do professor:\n");
    exibirProfessor(professor);
    
    return 0;
}
