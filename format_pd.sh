##SCRIPT PARA FORMATAR PENDRIVES NO SHELLSCRIPT
##AUTOR: MFS9 - github.com/mfs9
##Certifique-se de que o script tenha permissões de execução (chmod +x format_pd.sh) para poder ser executado.


#!/bin/bash

# Verificar se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo "Este script requer privilégios de superusuário. Por favor, execute-o como root."
    exit 1
fi

# Obter a lista de discos disponíveis
discos=($(lsblk -dn -o NAME))

# Verificar se há pendrives conectados
if [[ ${#discos[@]} -eq 0 ]]; then
    echo "Nenhum pendrive encontrado."
    exit 1
fi

# Exibir a lista de discos disponíveis
echo "Discos disponíveis:"
for ((i=0; i<${#discos[@]}; i++)); do
    echo "$i: ${discos[$i]}"
done

# Solicitar ao usuário que escolha o disco
while true; do
    read -p "Digite o número do disco correspondente ao pendrive: " numeroDisco
    if [[ $numeroDisco -ge 0 ]] && [[ $numeroDisco -lt ${#discos[@]} ]]; then
        break
    fi
done

discoEscolhido=${discos[$numeroDisco]}

# Desmontar as partições do pendrive, se estiverem montadas
sudo umount "/dev/${discoEscolhido}"* 2>/dev/null

# Limpar as partições existentes no pendrive
echo "Limpando partições no pendrive..."
sudo sgdisk --zap-all "/dev/${discoEscolhido}"
sudo partprobe "/dev/${discoEscolhido}"

# Criar uma nova partição exFAT ocupando todo o pendrive
echo "Criando nova partição exFAT no pendrive..."
sudo parted -s "/dev/${discoEscolhido}" mklabel gpt mkpart primary exfat 0% 100%

# Formatar a partição como exFAT
echo "Formatando a partição como exFAT..."
sudo mkfs.exfat "/dev/${discoEscolhido}1"

echo "Formatação concluída com sucesso."
