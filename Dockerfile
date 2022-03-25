FROM ibm-semeru-runtimes:open-17.0.2_8-jre-focal

LABEL org.opencontainers.image.authors="colsrch"

ENV TZ Asia/Shanghai

WORKDIR /app

ADD ./mcl/ .

RUN chmod +x mcl

CMD ["./mcl"]
