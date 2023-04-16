# Python Sandbox

This repo is to create a simple sandbox for Python. It is a simple way to run Python code without installing Python on your machine. It includes a few simple common dependencies for convenience.

## Development

1. Clone this repo
2. Run `make build` to build the image
3. RUn `make start` to open a shell in a container from the image

## Usage

Once you have this image locally, you can use it to wrap python code.

```bash
docker run -it --rm -v $(pwd):/usr/src/app python-sandbox python bash
```

If you need to run boto things, mount over your aws credentials directory by adding `-v ~/.aws:/root/.aws` to the above command.

Or, if you use aws-vault to manage credentials in the mac keychain, you can `docker run --env-file <(aws-vault exec --json <profile> env --duration=8h) -it --rm -v $(pwd):/usr/src/app python-sandbox python bash` to run the container with the same credentials as your host machine.

If you find yourself doing this frequently, you could consider adding a `Dockerfile` to your project that just pip installs the requirements you need.