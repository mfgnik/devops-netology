1.

c примет значение a+b, так как мы не ставим знак доллара, то есть не обращаемся к переменным
d пример значение 1+2, так как мы сложим переменные, но будем воспринимать их как строки
e примет значение 3, так как $(()) выполнит операцию 1+2

2.
Было найдено 3 ошибки: потеряна скобка после условия ((1==1), не было выхода из цикла и (возможно, это не ошибка) не было не большого засыпания для экономия памяти

```bash
#!/usr/bin/env bash
while ((1==1))
do
curl https://localhost:4757
if (($? != 0))
then
date >> curl.log 
else 
break
fi
sleep 3
done
```

3. 

```bash
#!/usr/bin/env bash
arr_int=(0 1 2 3 4)
ip_list=(192.168.0.1 173.194.222.113 87.250.250.242)
for i in ${arr_int[@]}
do
 for ip in ${ip_list[@]}
 do
  curl ${ip}:80 >> /dev/null
  if (($? != 0))
  then
   echo $ip is not accessible >> log
  else
   echo $ip is accessible >> log
  fi	
 done
sleep 1
done
```

4. 

```bash
#!/usr/bin/env bash
ip_list=(192.168.0.1 173.194.222.113 87.250.250.242)
while ((1==1))
do
 for ip in ${ip_list[@]}
 do
  curl ${ip}:80 >> /dev/null
  if (($? != 0))
  then
   echo $ip is not accessible >> err
   exit 0
  fi	
 done
 sleep 1
done
```
