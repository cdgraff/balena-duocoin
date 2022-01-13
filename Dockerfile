FROM balenalib/rpi-raspbian:latest

LABEL MAINTAINER="cdgraff@gmail.com"
LABEL DESCRIPTION="Duocoin Balena miner"
 
RUN install_packages git python3 python3-pip

WORKDIR /tmp
RUN git clone https://github.com/revoxhere/duino-coin && cd duino-coin && pip3 install -r requirements.txt

WORKDIR /tmp/duino-coin/Duino-Coin PC Miner 2.75/
ADD Settings.cfg Settings.cfg

WORKDIR /tmp/duino-coin/
ENTRYPOINT [ "python3", "PC_Miner.py" ]