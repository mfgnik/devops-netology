5. Выделено 1024 MB RAM, 64 GB HDD, 8 MB видеопамяти и 1 cpu.
6. Можно добавить в Vagrantfile v.cpu = 2 и v.cpus = 4
8. HISTSIZE, строка - 1178. ignoreboth позволяет управлять двумя опциями:
ignorespace — не сохранять строки начинающиеся с символа <пробел>
ignoredups — не сохранять строки, совпадающие с последней выполненной командой
9. Список, выполняемый в текущем инстансе терминала. Используются для подстановки элементов из списка в команду.
10. touch {1..100000}.txt. 300000 создать не получилось. На MacOS не получилось даже создать 100000 файлов, только 50000. Причина того, что не получается создать - слишком длинный список аргументов.
11. Конструкция проверяет наличие директории /tmp
12.
```bash
mkdir /tmp/new_path_dir/
cp /bin/bash /tmp/new_path_dir/
PATH=/tmp/new_path_dir/:$PATH
```
13. at запускает задачу в определенное время, batch же запускает программу, когда уровень загрузки системы падает до определенного уровня, устанавливаемого параметром atd (по умолчанию 1.5)
