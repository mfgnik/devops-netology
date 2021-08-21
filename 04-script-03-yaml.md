1. Ошибки две: первая - потеряна кавычка после ip, вторая - потеряны обе кавычки вокруг самого адреса.
2. 
```python
#!/usr/bin/env python3

import json
import socket
import time
import yaml
from datetime import datetime
from typing import Dict, Optional


def check_ips(services: Dict, yaml_path: Optional[str] = None, json_path: Optional[str] = None):
    wait_time = 2
    while True:
        changed = False
        for service in services:
            ip = socket.gethostbyname(service)
            if ip != services[service]:
                if services[service] is not None:
                    print(f'{datetime.now()} [ERROR] {service} IP mismatch: {services[service]} {ip}')
                services[service] = ip
                changed = True
        if changed:
            if yaml_path:
                with open(yaml_path, 'w') as f:
                    yaml.dump(services, f)
            if json_path:
                with open(json_path, 'w') as f:
                    json.dump(services, f)
        time.sleep(wait_time)


if __name__ == '__main__':
    check_ips(
        {'drive.google.com': None, 'mail.google.com': None, 'google.com': None}, 
        yaml_path='ips.yaml', 
        json_path='ips.json',
    )
```
