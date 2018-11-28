Popis testovaciho prostredi.
- v docker-compose je vydefinovana funkcni struktura testovaci prostredi ktera spusti nasleduji kontejnery
    - mysql - Percona 5.7
        - heslo root uziv. mysql je uvedeno v docker-compose.yml (MYSQL_ROOT_PASSWORD)
        - adresa serveru je ze vsech kontejneru vzdy " mysql "
        - pri prvnim spusteni se pokusi nacist data z db-data/.sql . soubory nacita v alfanumerickem poradi! do databaze dle promene MYSQL_DATABASE

    - adminer - web rozhrani k db
        - opravdu velmi lite
        - adresa serveru s mysql je " mysql "

    - phpmyadmin - web rozhrani k db
        - snad posleni verze
        - nese si sebou vlastni PHP a web server
        - adresa serveru s mysql je " mysql "

    - nginx-proxy - pouze http proxy za kterou jsou "schovane" vsechny weby
        - weby se pridavaji do proxy automaticky po jejich spusteni
        - adresa na ktere je dany web dostupny je uvedena v promene VIRTUAL_HOST v docker-compose u kazdeho nginx-app kontejneru

    - nginx-app1 + phpapp1 - kontejner s php-fpm (php 7.2) a kontejner s web serverem (nginx)
        - data pro web ukladej do slozky "www-data" !
        - v docker-compose je u toho kontejneru uvedena promena VIRTUAL_HOST - adresa na kterou bude reagovat proxy (nutne tedy pridat do /etc/hosts popsana nize)

    - nginx-app2 + phpapp2 - stejne jako predchozi ale s php 7.1
        - jako u predchozi

    - shell - pouze prazdny kontejner s centos7
        - prihlasis se do nej pomoci " docker-compose exec -ti shell bash"


- !!! pro spravnou funkci je treba zadat do /etc/hosts na tvem pocitaci nasledujici radek !!!
        127.0.0.1   app1.local app2.local adminer.local phpmyadmin.local


- kontejnery nahodis pomoci ./run.sh (start|stop|status|help)
- pokud nechces pozit run.sh "zkratku" tak postaru a rucne kontejnery nahodis pomoci " docker-compose up -d "; to co kontejnery vypisuji do logu udivis pomoci " docker-compose logs -f "


- aktualni nastaveni docker-compose tedy spusti nad jednim webem (php soubory) dva web servery kazdy z jinym php ( 7.1 a 7.2 ). Lze tedy testovat jeden web s vice php najednou.
Stejnym zpusobem pujde pracovat u vami pozadovanym prikladem, tedy jeden web z vice pohledu.
PS: idealne pouzivejte anonymni rezim prohlizece.

Otestovano na
Fedora 29
docker 1.13
docker-compose 1.22
