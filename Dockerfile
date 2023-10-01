FROM python:3.10

ARG REQUIREMENTS_FILE

WORKDIR /usr/src/app
COPY ${REQUIREMENTS_FILE} ./requirements.txt


RUN pip install --upgrade pip

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
