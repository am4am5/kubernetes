locale
locale -a
apt update && apt install -y locales && locale-gen ru_RU.UTF-8 && echo -e 'LANG="ru_RU.UTF-8"\nLANGUAGE="LANGUAGE=ru_RU"\n' > /etc/default/locale && dpkg-reconfigure --frontend=noninteractive locales

export LANG=ru_RU.UTF-8 \ 
export LANGUAGE=ru_RU:ru \
export LC_ALL=ru_RU.UTF8

ENV LANG ru_RU.UTF-8 \
    LANGUAGE ru_RU:ru \
    LC_ALL ru_RU.UTF8
