#!/bin/sh
# Autor: Tiago Gomes da Silva
# Email: tiago.gomes@ufms.br

echo "### Instalando SEISAN no Ubuntu ###"
sudo apt-get install libx11-dev -y
sudo apt-get install libncurses5-dev -y
sudo apt-get install gfortran -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
echo "Fazendo o update do Sistema"
echo ""
sudo apt-get update
echo ""
echo "Instalando o Java "
echo ""
sudo apt-get install oracle-java8-installer -y 
sudo apt-get install oracle-java8-set-default -y 
echo ""
echo "Versão do JAVA"
echo ""
java -version
echo ""

echo "Criando diretório de instalação..."
echo ""
sudo rm -r /home/$USER/seisan
mkdir /home/$USER/seisan
sudo rm master.zip
sudo rm -r seisan-master/
echo ""
echo "Fazendo o download dos arquivos..."
echo ""
wget https://github.com/gomes310/seisan/archive/master.zip
echo ""
echo "Descompactando..."
echo ""
unzip master*.zip
cd seisan-master
tar -xvzf seisan_v10.5_linux_64.tar.gz -C /home/$USER/seisan
tar -xvzf libmseed-2.19.5.tar.gz 
mv libmseed-2.19.5 libmseed 
mv libmseed /home/$USER/seisan/LIB 
mv SEISAN.bash /home/$USER/seisan/COM
mv MakefileLIB Makefile 
mv Makefile /home/$USER/seisan/LIB 
mv MakefilePRO Makefile 
mv Makefile /home/$USER/seisan/PRO 
cd /home/$USER/seisan/LIB/libmseed

echo ""
echo "Compilando o libmseed..."
echo ""
make all
make shared
cd /home/$USER/seisan/LIB
make clean
make all
cd /home/$USER/seisan/PRO
make all
cd /home/$USER/seisan/COM
echo ""
echo ""
echo "-------------------------------------------------"
echo "| No diretório /home/user/seisan/COM            |"
echo "| Execute os comandos                           |"
echo "|. SEISAN.bash                                  |"
echo "|remodl                                         |"  
echo "|setbrn                                         |"
echo "|Seu SEISAN está configurado e pronto para uso! |"
echo "-------------------------------------------------"


echo "### Fim da instalação do SEISAN ###"
