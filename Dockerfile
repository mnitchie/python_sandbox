# Stage 1: Base Python environment
FROM python:3.10 AS base-env
WORKDIR /usr/src/app
COPY requirements_base.txt ./requirements.txt
RUN pip install --upgrade pip==23.2.1
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
CMD ["bash"]

# Stage 2: Jupyter environment
FROM base-env AS jupyter-env
COPY requirements_jupyter.txt ./requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
