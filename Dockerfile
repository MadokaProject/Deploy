FROM centos:8

LABEL org.opencontainers.image.authors="colsrch"

COPY local_requirements.txt /root/

ENV TZ Asia/Shanghai
ENV LANG C.UTF-8

WORKDIR /app

# wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos8.x86_64.rpm -P /opt/ && \
# dnf localinstall -y /opt/wkhtmltox-0.12.6-1.centos8.x86_64.rpm && \ 

RUN yum install -y git python38 python38-pip wget
RUN yum groupinstall Fonts -y && \
    wget https://raw.githubusercontent.com/MadokaProject/Madoka/release/requirements.txt -P /root/ && \
    pip3 install -r /root/requirements.txt -r /root/local_requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["/bin/bash", "-c", "python3 main.py"]