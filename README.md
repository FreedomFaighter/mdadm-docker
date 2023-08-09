# `mdadm` RAID Recovery Docker Image

This Docker image provides a containerized environment equipped with tools (`mdadm` and `parted`) to assist in RAID recovery efforts.

Using this Docker image can help you run `mdadm` on Unraid servers or other custom linux servers without having to install any specific packages on your machine.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Using the Container](#using-the-container)
- [Building the Image](#building-the-image)
- [Contributions](#contributions)

## Prerequisites

- Docker
- Disk images for each disk in your RAID setup, these can be created using [`ddrescue`](https://www.gnu.org/software/ddrescue/)

## Using the Container

To use the container:

1. Start a container from the image:

```bash
docker run -d --privileged --name raid-recovery -v /path/to/images:/images ostlerdev/mdadm:latest
```

- `-d`: Runs the container in "detached" mode to keep the container running in the background.
- `--privileged`: Grants the container full capabilities, which are needed to work with devices like loopback and RAID.
- `--name`: Names the container `raid-container` for easier reference.
- `-v /path/to/images:/images`: Mounts your directory (where the RAID images are) to `/images` in the container. Replace `/path/to/images` with the actual path to your disk images.

2. Connect into the container: 

```bash
docker exec -it raid-recovery /bin/bash
```

3. You now have access to `mdadm` and `parted` to aid your recovery efforts.

## Building the Image

You can build the image locally with:

```bash
docker build -t mdadm:latest .
```

Or, pull it directly from Docker Hub:

```bash
docker pull ostlerdev/mdadm:latest
```

## Contributions

Contributions are welcome! Please create an issue or submit a pull request on GitHub.