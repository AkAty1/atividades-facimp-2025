#include <stdio.h>

int particiona(int *v, int inicio, int final){
    int esq, dir, pivo, aux;
    esq = inicio;
    dir = final;
    pivo = v[inicio];
    while(esq < dir){
        while(v[esq] <= pivo)
            esq++;
        while(v[dir] > pivo)
            dir--;
        if(esq < dir){
            aux = v[esq];
            v[esq] = v[dir];
            v[dir] = aux;
        }
    }
    v[inicio] = v[dir];
    v[dir] = pivo;
    return dir;
}

void quicksort(int *v, int inicio, int fim){
    int pivo;
    if(fim > inicio){
        pivo = particiona(v, inicio, fim);
        quicksort(v, inicio, pivo-1);
        quicksort(v, pivo+1, fim);
    }
}

void imprimir(int *v, int tamanho){
    int i;
    for(i = 0; i <= tamanho; i++)
    printf("%d ", v[i]);
    printf("\n");

}
int main(){
    int vet[] = {55,12,34,43,55,13,33,58,12,98}; //10   
    imprimir(vet,9);
    quicksort(vet,0,9);
    imprimir(vet,9);

    return 0;
}