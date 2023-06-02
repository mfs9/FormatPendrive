# Script de Formatação de Pendrive

Este é um script em shell que formata um pendrive selecionado pelo usuário com uma nova partição exFAT.
Este script foi escrito para utilização no Linux

## Requisitos

- Este script deve ser executado com privilégios de superusuário (root).

## Como usar

1. Abra um terminal.
2. Navegue até o diretório onde o script `format_pd.sh` está localizado.
3. Dê permissões de execução ao script:
   chmod +x format_pd.sh
4. Execute o script:
./format_pd.sh
5. Será exibida uma lista de discos disponíveis. Digite o número correspondente ao pendrive que deseja formatar.
6. O script limpará as partições existentes no pendrive selecionado e criará uma nova partição exFAT ocupando todo o espaço do pendrive.
7. A partição será formatada como exFAT.
8. Ao finalizar, você verá a mensagem "Formatação concluída com sucesso".
   Observação: Certifique-se de que o pendrive não esteja montado antes de executar o script.

Aviso
O uso deste script resultará na perda de todos os dados existentes no pendrive selecionado. Certifique-se de fazer backup dos seus dados importantes antes de executar o script.