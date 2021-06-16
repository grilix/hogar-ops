# Requisitos

Instalate `ansible`.

Para tener acceso al host usando la clave privada (sin contraseña),
tirá esta magia (asegurate de cambiar "<host>" por el host en cuestión):

```bash
cat ~/.ssh/id_rsa.pub | ssh "<host>" tee -a ~/.ssh/authorized_keys
```

Vas a necesitar un inventario, yo tengo un `inventory/casa.yml` que es
más o menos así:

```yml
all:
  vars:
    ansible_python_interpreter: /usr/bin/python3
    ansible_user: grilix
  hosts:
    bouncer:
    proxy:
    pi.hole:
    swarm:
    sandbox:
      ansible_host: "10.0.1.149"
    debian1:
      ansible_host: "10.0.2.15"
    flameslinger:
  children:
    workstations:
      hosts:
        flameslinger:
        bouncer:
      vars:
        target_user_name: "Gonzalo Arreche"
        target_user_email: "nomerobeselemail@example.com"
    apt_mirror:
      hosts:
        swarm:
    pi:
      hosts:
        proxy:
        pi.hole:
        sandbox:
      vars:
        remote_user: pi
        ansible_user: pi
    proxy_manager:
      hosts:
        proxy:
      vars:
        mysql_host: "10.0.2.10"
        mysql_db_name: manager
        mysql_user: manager
        mysql_password: "<password>"
        mysql_port: "31306"
```

# Uso

Con el inventario en la mano, le das al playbook que quieras:

```bash
ansible-playbook --ask-become-pass -i inventory/casa.yml setup-apt-mirror.yml
```
