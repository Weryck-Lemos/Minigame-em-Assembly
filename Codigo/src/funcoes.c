#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void gerar_mensagem(char *dest, int tamanho){
    srand(time(NULL));

    for(int i = 0; i<tamanho; i++){
        dest[i] = 'A' + rand()%26;
    }

    dest[tamanho]= '\0';
}

void banner() {
    printf("              ████████╗ ██╗  ██╗ ███████╗                            \n");
    printf("              ╚══██╔══╝ ██║  ██║ ██╔════╝                            \n");
    printf("                 ██║    ███████║ █████╗                              \n");
    printf("                 ██║    ██╔══██║ ██╔══╝                              \n");
    printf("                 ██║    ██║  ██║ ███████╗                            \n");
    printf("                 ╚═╝    ╚═╝  ╚═╝ ╚══════╝                            \n");
    printf("           ██╗   ██╗ ██╗ ████████╗ █████╗   ██╗                      \n");
    printf("           ██║   ██║ ██║ ╚══██╔══╝ ██╔══██╗ ██║                      \n");
    printf("           ██║   ██║ ██║    ██║    ███████║ ██║                      \n");
    printf("           ╚██╗ ██╔╝ ██║    ██║    ██╔══██║ ██║                      \n");
    printf("            ╚████╔╝  ██║    ██║    ██║  ██║ ███████╗                 \n");
    printf("             ╚═══╝   ╚═╝    ╚═╝    ╚═╝  ╚═╝ ╚══════╝                 \n");
    printf("███╗   ███╗ ███████╗ ███████╗ ███████╗  █████╗   ██████╗  ███████╗   \n");
    printf("████╗ ████║ ██╔════╝ ██╔════╝ ██╔════╝ ██╔══██╗ ██╔════╝  ██╔════╝   \n");
    printf("██╔████╔██║ █████╗   ███████╗ ███████╗ ███████║ ██║  ███╗ █████╗     \n");
    printf("██║╚██╔╝██║ ██╔══╝   ╚════██║ ╚════██║ ██╔══██║ ██║   ██║ ██╔══╝     \n");
    printf("██║ ╚═╝ ██║ ███████╗ ███████║ ███████║ ██║  ██║ ╚██████╔╝ ███████╗   \n");
    printf("╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝  ╚═════╝  ╚══════╝ \n\n");
}

int pontos(char *mensagem, char*resposta){
    int acertos = 0;
    int tam = strlen(mensagem);
    for(int i=0; i<tam && resposta[i] != '\0'; i++){
        if(mensagem[i] == resposta[i]){
            acertos++;
        }
    }

    printf("\nPontos: %d/%d\n", acertos, tam);

    return acertos;
}