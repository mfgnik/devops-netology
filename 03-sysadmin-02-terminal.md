1. Тип команды встроенной. Причина ее типа в том, чтобы менять текущую директорию как раз для оболочки, где она выполняется и не использовать внешние вызовы.
2. Использовать ключ -c. ```bash grep <some_string> <some_file> ```
3. systemd
4. На macOS: ```ls > /dev/tts001```, на Ubuntu - ```ls > /dev/pts/1```
5. ```cat < in > out```
6. Данные вывести можно. Например, ls > /dev/tty3. Наблюдать не получится, только перевестись в контекст TTY.
7. Первая команда создаст файловый дескриптор с номером 5 и перенаправит его в stdout. Вторая перенаправит строку netology в файловый дескриптор 5, откуда она попадет в stdout. 
8. Сделаем так ```ls  /root 5>&2 2>&1 1>&5```. Создадим промежуточный дескриптор с номером 5, перенаправим его на stderr, stderr в stdout, а затем уже stdout в дескриптор.         
9. Получим переменные окружения. В более удобном виде их можно получить с помощью команды env.
10. /proc/PID/cmdline - путь к исполняемому файлу
/proc/PID/exe - ссылка на исполняемый файл
11. Версия 4.2, узнал с помощью команды grep sse /proc/cpuinfo
12. Когда запускаем команду через ssh tty не создается. Это делается для удобства передачи бинарных данных. Поэтому чтобы tty создался нужно добавить тег -t.
13. Попробовал, получилось. 
14. Команда tee считывает stdin и записывает его в stdout и в указанный файл или переменую. sudo tee получает на вход string и имея все нужные права записывает в /root/new_file  