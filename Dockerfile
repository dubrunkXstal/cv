ARG BASE=debian:10.1
FROM ${BASE}

RUN set -eux; \
    echo 'deb http://archive.debian.org/debian buster main contrib non-free' > /etc/apt/sources.list; \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        texlive-xetex \
        texlive-fonts-recommended \
        latexmk \
        fonts-dejavu-core; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

ENTRYPOINT ["latexmk", "-pdfxe", "-cd", "-interaction=nonstopmode", "-halt-on-error"]
CMD ["CV/main.tex"]
