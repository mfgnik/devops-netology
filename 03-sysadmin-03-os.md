1. К cd отнсится вызов ```chdir("/tml") ```

2. Базу будем искать командой: ```strace file file_path 2>&1 | grep open```
Сначала базу искали по пути "/etc/magic.mgc", но не нашли

```
openat(AT_FDCWD, "/etc/magic.mgc", O_RDONLY) = -1 ENOENT (No such file or directory)
```
А затем нашли по пути "/usr/share/misc/magic.mgc"
```
openat(AT_FDCWD, "/usr/share/misc/magic.mgc", O_RDONLY) = 3
```

3. Сделаем echo пустой строкой в нужный файловый дескриптор.
```
echo `` > /proc/$PROC_ID/fd/$FD
```
PROC_ID и FD - id процесса и номер файлового дескриптора удаленного файла.

4. Как было сказано на лекции, зомби процессы потребляют ресурсы только в памяти ядра, так как там хранится информация о них.

5. Почему-то у всех команд не был отображен PATH, сами команды: 
- lpstat
- sh
- sed
- dbus-daemon

6. Системный вызов uname. Из strace: 
```
uname({sysname="Linux", nodename="ubuntu-linux-20-04-desktop", ...}) = 0
```
Информация из man:
```
Part of the utsname information is also accessible  via  /proc/sys/ker‐
       nel/{ostype, hostname, osrelease, version, domainname}.
```

7. Если команда имеет вид ```cmd1 ; cmd2```, то вторая команда выполнится независимо от результата первой.
Если же команда имеет вид ```cmd1 && cmd2```, то вторая команда выполнится тогда и только тогда, когда выполнится первая.
В первом случае set -e прервет сессию после невыполнения первой программы.
Во втором же случае поведение никак не изменится.

8.

Распишем по каждому флагу его значение

- -e прерывает сессию после первой ошибки
- -x выводит команды после того, как они выполняются
- -u считает необъявленные переменные ошибкой
- -o pipefail код возврата становится значением кода возврата последней команды, имеющей ненулевой код возврата, или 0, если все имеют нулевой код возврата

Сценарий удобен для дебага, так как позволяет отловить все ошибки (неинициализированные переменные, команды, выполняющиеся с ошибками)

9.

```
$ ps -o stat

STAT
Ss
R+
```
Значения статусов:
- R - запущенные процессы.  
- S - находящиеся в состоянии прерываемого сна.

Значения дополнительных букв:

- ```+``` означает, что процесс находится в группе на переднем плане
- ```s``` - лидер сессии
