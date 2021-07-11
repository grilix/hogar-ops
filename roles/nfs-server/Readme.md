# nfs-server

Configura un servidor NFS para compartir multimedios.

## Uso

```yml
# playbook.yml
---
- name: Configurar servidor nfs
  hosts: nfs_servers
  vars:
    nfs_server_path: /srv/nfs
    nfs_media_device_uuid: "d768526f-cf0f-4ab6-a2fa-18deb765d5e4"
    nfs_media_shares: >
      *(rw,mp,subtree_check,sync,all_squash)
```

### En los clientes:

Instalar el paquete `nfs-common` y configurar el `mount`:

```bash
sudo apt-get install nfs-common
sudo mount -t nfs4 "<host>:/srv/nfs/media /media/nfs/media
```

