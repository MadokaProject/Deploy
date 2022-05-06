FROM python:3.8-slim

LABEL org.opencontainers.image.authors="colsrch"

ADD https://raw.githubusercontent.com/MadokaProject/Madoka/release/requirements.txt \
    local_requirements.txt /root/

ENV TZ Asia/Shanghai
ENV LANG C.UTF-8

WORKDIR /app

RUN pip install -r /root/requirements.txt -r /root/local_requirements.txt

CMD ["/bin/bash", "-c", "python main.py"]