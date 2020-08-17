locale
locale -a
# apt update && apt install -y locales && locale-gen ru_RU.UTF-8 && echo -e 'LANG="ru_RU.UTF-8"\nLANGUAGE="LANGUAGE=ru_RU"\n' > /etc/default/locale && dpkg-reconfigure --frontend=noninteractive locales

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

