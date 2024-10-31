
// MyCFunctions.m
#include "MyFunctions.h"

void myCFunction(void){
    // Выделение памяти для структуры
    VulnerableStruct *myStruct = (VulnerableStruct *)malloc(sizeof(VulnerableStruct));
    if (myStruct == NULL) {
        fprintf(stderr, "Ошибка выделения памяти\n");
        return;
    }

    // Выделение памяти для строки внутри структуры
    myStruct->data = (char *)malloc(100 * sizeof(char));
    if (myStruct->data == NULL) {
        fprintf(stderr, "Ошибка выделения памяти\n");
        free(myStruct);
        return;
    }

    // Копирование данных в строку
    strcpy(myStruct->data, "Hello from vulnerable function!");
    printf("Data: %s\n", myStruct->data);

    // Освобождение памяти структуры, но сохранение указателя
    free(myStruct->data);
    free(myStruct);

    // Ошибочное повторное использование освобожденного указателя

    printf("Accessing freed data: %s\n", myStruct->data); // UAF уязвимость
}
void myStackOverflowFunction(const char *input) {
    char buffer[10];
    strcpy(buffer, input); // Stack overflow уязвимость
    printf("Buffer: %s\n", buffer);
}

void myHeapOverflowFunction(const char *input) {
    char *buffer = (char *)malloc(10 * sizeof(char));
    if (buffer == NULL) {
        fprintf(stderr, "Ошибка выделения памяти\n");
        return;
    }

    // Heap overflow уязвимость
    strcpy(buffer, input);
    printf("Heap buffer: %s\n", buffer);

    free(buffer);
}
void myIntegerOverflowFunction(const char *input) {
    int length = atoi(input); // Преобразование строки в целое число
    int array[length];

    // Демонстрация целочисленного переполнения
    for (int i = 0; i <= length; i++) {
        array[i] = i;
    }

    printf("Array populated up to length: %d\n", length);
}
