extern gerar_mensagem
extern printf
extern scanf
extern banner
extern pontos

segment .data
    LF equ 0xA
    NULL equ 0xD
    SYS_CALL equ 0x80

    ;EAX
    SYS_EXIT equ 0x1
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4

    ;EBX
    RET_EXIT equ 0x0
    STD_IN equ 0x0
    STD_OUT equ 0x1

    ;para funcionar o printf
    formato_s db "%s", 0XA ,0

    prompt db "Digite a mensagem: ", 0
    limpar_tela db 0x1B, '[2J', 0x1B, '[H', 0
    msg_acertou db "MENSAGEM CORRETA! A GUERRA ACABOU!!!", 0
    msg_errou db 0xA,"VOCÊ ERROU!!!", 0
    correcao db "MENSAGEM CORRETA: ",0

    msg_dificuldade db 0xA, "Escolha a dificuldade (4 a 10): ", 0
    msg_invalido db 0xA, "Dificuldade inválida.", 0xA, 0xA, 0
    scanf_d_int db "%d", 0

segment .bss
    msg resb 11     
    resposta resb 11
    tamanho resd 1

segment .text



;-----------------------
;*   Limpar Terminar   *
;-----------------------
limpar:
    push limpar_tela
    push formato_s
    call printf
    add esp,8
    ret
;-----------------------



;-----------------------
;*       Delay         *
;-----------------------
delay:
    push ecx
    mov ecx, eax
    
.delay_loop:
    nop
    loop .delay_loop
    pop ecx
    ret
;-----------------------



;-----------------------
;*   Comparar Strings  *
;-----------------------
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
;-----------------------



;-----------------------
;*     Dificuldade     *
;-----------------------
solicitar_dificuldade:
.loop:
    push msg_dificuldade
    push formato_s
    call printf
    add esp, 8

    push tamanho
    push scanf_d_int
    call scanf
    add esp, 8

    mov eax, [tamanho]

    ; if (dificuldade < 4 || dificuldade > 10)
    cmp eax, 4
    jl .invalido
    cmp eax, 10
    jg .invalido

    ; else -> return dificuldade
    ret

.invalido:
    push msg_invalido
    push formato_s
    call printf
    add esp, 8
    jmp .loop
;------------------------