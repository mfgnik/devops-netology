1. Для того, чтобы поместить в автозагрузку нужно создать файл `/etc/systemd/system/node_exporter.service` с данным содержанием:
```
[Unit]
Description=Node Exporter
 
[Service]
ExecStart=/opt/node_exporter/node_exporter --web.config=web-config.yml
EnvironmentFile=/etc/default/node_exporter
 
[Install]
WantedBy=default.target
```
Теперь для того, чтобы добавить опции через внешний файл их нужно добавить в `/etc/default/node_exporter`

2.
cpu:
- node_cpu_seconds_total 
- go_memstats_gc_cpu_fraction
- process_cpu_seconds_total

memory:
- node_memory_Active_file_bytes
- node_memory_Inactive_bytes
- node_memory_SwapFree_bytes
- node_memory_MemAvailable_bytes
- node_memory_MemFree_bytes

disk:
- node_disk_io_now
- node_disk_io_time_seconds_total
- node_disk_read_bytes_total
- node_disk_read_time_seconds_total
- node_disk_write_time_seconds_total
- node_disk_written_bytes_total

network:
- node_network_receive_bytes_total
- node_network_receive_errs_total
- node_network_receive_drop_total
- node_network_transmit_bytes_total
- node_network_transmit_errs_total
- node_network_transmit_drop_total

3. Зайти получилось, ознакомился с метриками по cpu, load, disk, ram, swap, network, processes

4. Да, можно понять по выводу данной команды
```
parallels@ubuntu-linux-20-04-desktop:~$ dmesg |grep virtualiz
[    3.550209] systemd[1]: Detected virtualization parallels.
```

5. Параметр означает лимит на количество открытых дескрипторов. По умолчанию он равен 1048576.
Мягкий лимит, который не позволит достигнуть - ```ulimit -n ```

6. Запустим ```sleep 1h ``` и узнаем pid процесса
```
parallels@ubuntu-linux-20-04-desktop:~$ ps -e |grep sleep
   3827 pts/0    00:00:00 sleep
```
Теперь выполним ```sudo nsenter --target 3827 --pid --mount```
И, наконец, выполним ps
```
parallels@ubuntu-linux-20-04-desktop:~$ ps
    PID TTY          TIME CMD
   4609 pts/0    00:00:00 bash
   4621 pts/0    00:00:00 ps
```
7. Если переименовать двоеточие в fu и добавить переносы строк, то можно получить
```
fu{
    fu | fu &
}; fu
```
Таким образом, мы имеем функцию, которая при запуске создает два эквивалента себя.

Механизм, останавливающий работу это `cgroup: fork rejected by pids controller in`
Чтобы такого не повторялось в будущем, можно применить команду ```ulimit -u 100``` и после этого количество процессов будет ограничено.
