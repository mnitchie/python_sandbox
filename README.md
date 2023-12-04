# Python Sandbox

This repository provides a simple sandbox for Python development without requiring a local Python installation. It includes two Docker images:

- `vanilla`: A basic Python environment with a few common dependencies.
- `jupyter`: An environment set up for Jupyter notebooks.

## Development

1. Clone this repo.
2. Run `make build` to build both the `vanilla` and `jupyter` images.
3. Run `make start` to open a shell in a container from the `vanilla` image, or `make start_jupyter` for the `jupyter` image.

## Usage

### Vanilla Image

To use the `vanilla` image, you can run:

```bash
docker run -it --rm -v $(pwd):/usr/src/app python_sandbox_vanilla bash
```

### Jupyter Image

To use the jupyter image, you can run the following, which will automatically start a jupyter notebook server:

```bash
docker run -it --rm -v $(pwd):/usr/src/app -p 8888:8888 python_sandbox_jupyter
```

## Aliases

To have these commands easily available outside of this repo, create an alias

```
echo "alias python-sandbox-vanilla='docker run -it --rm -v $(pwd):/usr/src/app python_sandbox_vanilla bash'" >> ~/.bashrc
echo "alias python-sandbox-jupyter='docker run -it --rm -v $(pwd):/usr/src/app -p 8888:8888 python_sandbox_jupyter'" >> ~/.bashrc
```



## Additional Options

For AWS operations, mount your AWS credentials directory by adding `-v ~/.aws:/root/.aws` to the above commands.

If you use aws-vault, run the container with the same credentials as your host machine:

```bash
docker run --env-file <(aws-vault exec --json <profile> env --duration=8h | jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]') -it --rm -v $(pwd):/usr/src/app python_sandbox_vanilla bas
```