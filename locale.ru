locale
locale -a
apt update && apt install -y locales && locale-gen ru_RU.UTF8 en_US.UTF8
update-locale LANG=ru_RU.UTF8

