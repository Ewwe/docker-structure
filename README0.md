# App Selfcare Axfone


#### Crony

Popis | Controller | Databáze | Crontab
------------ | ------------- | ------------- | -------------
Změna kontaktů | ```app\commands\ChangeContactDetailsController``` |  ```selfcare.cc_change_contact_details``` | ```* * * * * root php72 /var/www/clients/client2/web7/web/yii change-contact-details/index```
Příprava notifikací | ```app\commands\PrepareNotificationSendController``` | ```selfcare.cc_notifications_prepare``` | ```*/1 * * * * root php72 /var/www/clients/client2/web7/web/yii prepare-notification-send/prepare```
Odeslání notifikací | ```app\commands\NotificationSendController``` | ```selfcare.cc_notifications_send``` | ```*/1 * * * * root php72 /var/www/clients/client2/web7/web/yii notification-send/send```
Párováno SetTopBoxu |  ```app\commands\NordicController``` | ```mya2billing.cc_iptv_order``` |  ```0 * * * * root php72 /var/www/clients/client2/web7/web/yii nordic/iptv-check-pairing-status ```
PPL ID Assigned |  ```app\commands\NordicController``` | ```mya2billing.cc_iptv_order``` |  ```0 * * * * root php72 /var/www/clients/client2/web7/web/yii nordic/iptv-check-package-number```
PPL Delivery |  ```app\commands\NordicController``` | ```mya2billing.cc_iptv_order``` |  ```0 * * * * root php72 /var/www/clients/client2/web7/web/yii nordic/iptv-check-ppl-delivered```
Credentials Sent|  ```app\commands\NordicController``` | ```mya2billing.cc_iptv_order``` |  ```0 * * * * root php72 /var/www/clients/client2/web7/web/yii nordic/iptv-send-credentials```

#### Params
- accessible-id - ```yxz``` nebo id resellera
- selfcare-id - id instalace selfcaru

#### Bacha List
* config/params.php - nastavení selfcaru
* web/index.php - debug


#### Nahrání na WEB4
* Připojit na devel-isp
* mc /var/www/selfcare-dev.axfone.eu/web
* Označit vše kromě vendor( jen při změně ), stats,runtime,config ( jen konkretní soubor ), /web/index.php nechat debug na false a env na prod
* Připojit se na web4 do složky <selfcare>/web ( <selfcare> "zakaznik.nordictelecom.cz")
* F5
* Odskrtnout Preserver attributes => <OK>
