FROM python:3.10

WORKDIR /usr/src/app
COPY requirements.txt ./


RUN pip install --upgrade pip

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
