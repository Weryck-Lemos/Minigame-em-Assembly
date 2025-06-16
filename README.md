# 🛰️ The Vital Message

**The Vital Message** é um jogo de memória em Assembly onde você assume o papel de um operador de comunicações a laser. Seu objetivo é interceptar mensagens codificadas enviadas por robôs inimigos e retransmiti-las corretamente ao Comando Central. Uma resposta correta impede o ataque — mas um erro pode ser fatal!

> 🎓 Projeto desenvolvido como parte da disciplina **Organização de Computadores e Linguagens de Montagem 1 (2025.1)**.

> ⚠️ Compatível apenas com **sistemas Linux**, utilizando NASM e `ld` (GNU Linker) para compilação.

---

## 🎮 Como Jogar

1. Ao iniciar o jogo, você escolhe um **nível de dificuldade entre 4 e 10**.
2. Será exibida uma sequência aleatória de letras maiúsculas (A–Z), cujo tamanho depende da dificuldade escolhida.
3. Você tem apenas alguns segundos para memorizar a mensagem.
4. Em seguida, ela desaparece e você precisa digitar exatamente o que foi mostrado.
5. O jogo dirá se você acertou ou errou.

✅ Quanto maior a dificuldade, maior a sequência — e menor o tempo para memorização!

---

## ⚙️ Como Executar

> Certifique-se de estar em um sistema Linux com as ferramentas necessárias instaladas.

### 1. Instale as dependências (se ainda não tiver)

No Ubuntu/Debian:

```bash
sudo apt update
sudo apt install nasm make
```

### 2. Executar Programa

No terminal:

```bash
cd Codigo
make
make run
```