FROM rockylinux:8.5

LABEL org.opencontainers.image.authors="colsrch"

COPY local_requirements.txt /root/

ENV TZ Asia/Shanghai
ENV LANG C.UTF-8

WORKDIR /app

RUN yum install -y git python38 python38-pip wget && \
    wget https://raw.githubusercontent.com/MadokaProject/Madoka/release/requirements.txt -P /root/ && \
    pip3 install -r /root/requirements.txt -r /root/local_requirements.txt

CMD ["/bin/bash", "-c", "python3 main.py"]