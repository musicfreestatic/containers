## Build

	docker build -t octopress .

## Run

There are a couple of environment variables that you can set to
control how the container is run.

- SOURCE => path to the octopress source in the container (/source)
- DEST   => path to the output directory in the container (/public)
- SERVE  => Run `jekyll serve` (for debugging and testing) (0)
- REPO   => Path to a git repo to clone into SOURCE

### Testing

	docker run --rm -it -v /path/to/source:/source \
		-p 4000:4000 -e SERVE=1 octopress

### Production

Generate site from a git repository.

	docker run --rm -v /path/to/html:/public -e REPO=https://github.com/user/repo octopress

Generate site from a source directory on the host system.

	docker run --rm -v /path/to/html:/public -v /path/to/source:/source octopress


