# backup-mariadb
Script simples para rodar o mysqldump e escrever os arquivos de backup separados em um diretorio.

Apagará os backups antigos (x dias configurados em uma variável dentro do script)

Assim podemos rodar via crontab e nao havera preocupacao de encher todo o disco.

As configuracoes deverao ser realizadas no arquivo config.txt presente no mesmo diretorio do script.
O arquivo config.txt.sample eh um exemplo do formato desse arquivo.


