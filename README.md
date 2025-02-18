# docker-rippanda-dev
## Description
This is the development docker image for [rippanda](https://github.com/lovesyk/rippanda) based on Eclipse Temurin JDK17.

It builds a fresh copy of the tool using the master branch.

## Example docker-compose.yml
```
version: "2.4"

services:
  rippanda:
    build: ../../images/rippanda
    container_name: rippanda
    network_mode: host
    user: 1000:1000
    volumes:
      - type: bind
        source: /mnt/storage/archive-dir
        target: /archive-dir
      - type: bind
        source: /mnt/storage/success-dir
        target: /success-dir
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /usr/share/zoneinfo:/usr/share/zoneinfo:ro
```

## Example run
```
docker-compose run --rm rippanda \
--cookies "ipb_member_id=42; ipb_pass_hash=deadbeef" \
--success-dir "/mnt/storage/success-dir" \
--archive-dir "/mnt/storage/archive-dir" \
--url "https://somepandasite.org/?f_search=artbook" \
download
```
