%include "src/biblioteca.inc"
section .text
global main

main:
    call banner

    mov eax, 30000000000
    call delay
    call limpar

    call solicitar_dificuldade
    mov [tamanho], eax

    push dword [tamanho]
    push msg
    call gerar_mensagem
    add esp, 8

    push msg
    push formato_s
    call printf
    add esp,8
    mov eax, 80000000000
    call delay
    call limpar

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, resposta
    mov edx, [tamanho]
    add edx, 1
    int SYS_CALL

    mov eax, [tamanho]
    mov byte [resposta + eax], 0

;Verifica se resposta == msg
    mov ecx, msg
    mov edx, resposta
    call strcmp_simples

    push resposta
    push msg
    call pontos
    add esp, 8

;Errou a Resposta
    mov ebx, eax
    mov eax, [tamanho]
    cmp ebx, eax
    jne .errou

;Acertou a Resposta
    push msg_acertou
    push formato_s
    call printf
    add esp, 8
    jmp .fim


.errou:
    push msg_errou
    push formato_s
    call printf
    add esp, 8

    push correcao
    push formato_s
    call printf
    add esp, 8

    push msg
    push formato_s
    call printf
    add esp, 8

.fim:
    xor eax, eax 
    ret