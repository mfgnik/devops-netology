1. В c будет ошибка, так как складываем число и строку.
Чтобы получить строку 12: ```python str(a) + b```.
Чтобы получить число 3: ```python a + int(b)```.
2. 
Найденные ошибки: из-за break выводит только первый файл и ненужный булевый флаг. 
```python
#!/usr/bin/env python3

import os

path = '~/netology/sysadm-homeworks'
bash_command = [f"cd {path}", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(os.path.join(path, prepare_result))

```
3.
```python
#!/usr/bin/env python3
import os
import subprocess
import sys


def check_path(path):
    bash_command = [f"cd {path}", "git status"]
    p = subprocess.Popen(
        ' && '.join(bash_command),
        shell=True,
        bufsize=-1,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    if 'fatal' in p.stderr.read().decode():
        print('Path is not git repository')
        return
    result_os = p.stdout.read().decode()
    for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = result.replace('\tmodified:   ', '')
            print(os.path.join(path, prepare_result))


if __name__ == '__main__':
    if len(sys.argv) >= 2:
        path = sys.argv[1]
    else:
        path = os.getcwd()
    check_path(path)

```
4. 
```python
import socket
import time
from datetime import datetime

wait_time = 2
services = {'drive.google.com': None, 'mail.google.com': None, 'google.com': None}
while True:
    for service in services:
        ip = socket.gethostbyname(service)
        if ip != services[service]:
            if services[service] is not None:
                print(f'{datetime.now()} [ERROR] {service} IP mismatch: {services[service]} {ip}')
            services[service] = ip
    time.sleep(wait_time)
```
