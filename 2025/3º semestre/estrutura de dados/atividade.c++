#include <iostream>
#include <vector>
using namespace std;

// Função com variável estática para demonstrar persistência entre chamadas
void printCallCount() {
    static int callCount = 0; // A variável estática mantém seu valor entre chamadas
    callCount++;
    cout << "Número de chamadas da função: " << callCount << endl;
}

// Função para encontrar o valor máximo no array
// Utiliza referência constante para evitar cópia desnecessária do vetor
int findMax(const vector<int>& arr) {
    int maxVal = arr[0]; // Inicializa com o primeiro elemento do vetor
    for (size_t i = 1; i < arr.size(); i++) {
        if (arr[i] > maxVal) {
            maxVal = arr[i]; // Atualiza o valor máximo encontrado
        }
    }
    return maxVal; // Retorna o maior valor encontrado
}

// Função para calcular a soma dos elementos do array
// Utiliza um loop de intervalo baseado em range para maior legibilidade
int calculateSum(const vector<int>& arr) {
    int sum = 0;
    for (int num : arr) { // Itera sobre cada elemento do vetor
        sum += num; // Acumula a soma dos valores
    }
    return sum; // Retorna o valor total da soma
}

int main() {
    const int MAX_SIZE = 1000; // Limite máximo de elementos no vetor
    int size;

    // Solicita o tamanho do array ao usuário
    cout << "Digite o tamanho do array (máximo " << MAX_SIZE << "): ";
    cin >> size;

    // Verifica se o tamanho inserido é válido
    if (size <= 0 || size > MAX_SIZE) {
        cout << "Tamanho inválido! Deve ser entre 1 e " << MAX_SIZE << "." << endl;
        return 1;
    }

    // Criação do vetor dinâmico usando std::vector
    vector<int> dynArray(size);
    cout << "Digite " << size << " valores inteiros:" << endl;
    for (int i = 0; i < size; i++) {
        cin >> dynArray[i]; // Preenche o vetor com os valores fornecidos pelo usuário
    }

    // Exibe a soma e o maior valor do vetor
    cout << "Soma dos elementos: " << calculateSum(dynArray) << endl;
    cout << "Maior valor: " << findMax(dynArray) << endl;

    // Demonstração de variável estática em ação
    // Chama a função múltiplas vezes para mostrar que a variável mantém seu valor
    for (int i = 0; i < 5; i++) {
        printCallCount();
    }

    return 0; // Finaliza o programait 
}
