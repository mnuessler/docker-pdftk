# Docker PDFTK

[![Docker Pulls][pulls-badge]][docker-hub]


Docker image for [pdftk], the PDF toolkit.

## Usage

Mount the directory with input files under `/work` when starting the
container. Output files will be written to the same directory.

```
docker run -v $(pwd):/work mnuessler/pdftk
```

[pulls-badge]: https://img.shields.io/docker/pulls/mnuessler/pdftk.svg?maxAge=3600
[docker-hub]: https://hub.docker.com/r/mnuessler/pdftk/
[pdftk]: https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/
