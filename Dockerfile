FROM colsrch/pdm:latest AS builder

WORKDIR /build
ADD https://raw.githubusercontent.com/MadokaProject/Madoka/release/pdm.lock ./
ADD https://raw.githubusercontent.com/MadokaProject/Madoka/release/pyproject.toml ./

RUN pdm config python.use_venv false && \
    pdm install -G mysql --prod --no-lock --no-editable

FROM python:3.9-slim

LABEL org.opencontainers.image.authors="colsrch"

ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
ENV PYTHONPATH=/app/pkgs
WORKDIR /app
COPY --from=builder /build/__pypackages__/3.9/lib /app/pkgs

RUN pip config set install.prefix /app/user_pkgs && \
    echo "/app/user_pkgs/lib/python3.9/site-packages" > /usr/local/lib/python3.9/site-packages/user_pkgs.pth && \
    apt-get update && apt-get install git -y && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/*

CMD ["python", "main.py"]
