# Alpine Setup Script

```bash
sudo apk add screen man man-pages
sudo apk add git
sudo apk add go
sudo apk add make musl-dev gcc g++ build-base
```

## Install SQL Database

```bash
sudo apk add sqlite sqlite-libs sqlite-doc
```

## Install Gog as "git"

From https://gogs.io/docs/installation/install_from_source.html:

```bash
sudo adduser -S -g 'Gogs' git
git clone --depth 1 https://github.com/gogs/gogs.git gogs
cd gogs
go build -tags "sqlite cert" -o gogs
```

## Set up Go ENV

```bash
echo "export PATH=$PATH:/usr/lib/go/bin" >> /home/alpine/.profile
source ~/.profile
```
