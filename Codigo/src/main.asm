%include "src/biblioteca.inc"

extern gerar_mensagem
extern imprimir
extern solicitar_dificuldade
extern banner
extern pontos

section .bss
    msg resb 11     
    resposta resb 11
    tamanho resd 1

section .data
    prompt db "Digite a mensagem: ", 0
    limpar_tela db 0x1B, '[2J', 0x1B, '[H', 0
    msg_acertou db "MENSAGEM CORRETA! A GUERRA ACABOU!!!", 0
    msg_errou db 0xA,"VOCÊ ERROU!!!", 0
    correcao db "MENSAGEM CORRETA: ",0

section .text
global main

main:
    call banner

    mov eax, 10000000000
    call delay
    call limpar

    call solicitar_dificuldade
    mov [tamanho], eax

    push dword [tamanho]
    push msg
    call gerar_mensagem
    add esp, 8

    push msg
    call imprimir
    add esp,4
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
    call imprimir
    add esp, 4
    jmp .fim


.errou:
    push msg_errou
    call imprimir
    add esp, 4

    push correcao
    call imprimir
    add esp, 4

    push msg
    call imprimir
    add esp, 4

.fim:
    xor eax, eax 
    ret



    ;Funcao Limpar Tela
limpar:
    push limpar_tela
    call imprimir
    add esp,4
    ret


    ;Funcao Delay
delay:
    push ecx
    mov ecx, eax
    
.delay_loop:
    nop
    loop .delay_loop
    pop ecx
    ret


    ;Comparar Strings
strcmp_simples:
    push esi
    push edi

    mov esi, ecx        ;msg
    mov edi, edx        ;resposta
.compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne .diferente
    cmp al, 0           ; fim da string
    je .igual
    inc esi
    inc edi
    jmp .compare_loop

.igual:
    xor eax, eax
    jmp .fim_cmp

.diferente:
    mov eax, 1

.fim_cmp:
    pop edi
    pop esi
    ret    