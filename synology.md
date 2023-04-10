
# Docker
docker network create --driver=macvlan --gateway=10.0.0.1 --subnet=10.0.0.0/24 --ip-range=10.0.0.50/32 -o parent=host eth1-adguard

docker network create --driver=macvlan --gateway=10.0.0.1 --subnet=10.0.0.0/24 --ip-range=10.0.0.50/32 -o parent=eth1 eth1-adguard

docker network create --driver=macvlan --gateway=10.0.0.1 --subnet=10.0.0.0/24 --ip-range=10.0.0.50/28 -o parent=eth1 eth1-50



https://smartlan.net/?p=562
https://www.wundertech.net/how-to-use-docker-on-a-synology-nas/
https://drfrankenstein.co.uk/step-3-setting-up-a-docker-bridge-network/
https://blog.alexis.lc/docker-macvlan-network-synology

# xpenology
https://xpenology.com/forum/topic/62547-tutorial-install-dsm-7x-with-tinycore-redpill-tcrp-loader-on-esxi/
https://thunderysteak.github.io/workstation-vmdk-2-esxi
https://github.com/pocopico/tinycore-redpill


# tests
https://www.forum-nas.fr/threads/utilisation-dun-ssd-nvmem2-en-tant-que-volume-de-stockage-dans-un-synology-ds920.18926/
https://www.forum-nas.fr/threads/volume-sur-ssd-nvme-quel-disque-s-choisir.17801/page-2


https://www.nas-forum.com/forum/topic/73600-tuto-plex-via-docker-version-express-configurations/

https://www.reddit.com/r/synology/comments/a7o44l/guide_use_nvme_ssd_as_storage_volume_instead_of/
https://blog.sylo.space/use-nvme-ssd-as-storage-volume-instead-of-cache-in-ds920/

https://mariushosting.com/

https://docs.tandoor.dev/