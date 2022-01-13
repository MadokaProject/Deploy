FROM centos:8

LABEL org.opencontainers.image.authors="colsrch"

COPY local_requirements.txt /root/

ENV TZ Asia/Shanghai

WORKDIR /app

RUN yum install -y git python38 python38-pip wget
RUN wget https://raw.githubusercontent.com/MadokaProject/Application/release/requirements.txt -P /root/ && \
    pip3 install -r /root/requirements.txt -r /root/local_requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["/bin/bash", "-c", "python3 main.py"]