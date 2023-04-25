# Anthias - Digital Signage for the Raspberry Pi

![Anthias Logo](https://github.com/Screenly/Anthias/blob/master/static/img/dark.svg?raw=true  "Anthias Logo")

## Screenly OSE is now known as Anthias

To clear up confusion between Screenly and Anthias, we have decided to rename Screenly OSE to Anthias. More details can be found in [this blog post](https://www.screenly.io/blog/2022/12/06/screenly-ose-now-called-anthias/). The renaming process is now under way, and over the coming months, Anthias will receive a face lift and the love it deserves.


Want to help Anthias thrive? Support us using [GitHub Sponsor](https://github.com/sponsors/Screenly).

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Screenly/Anthias&type=Date)](https://star-history.com/#Screenly/Anthias&Date)


## Disk images

The quickest way to get started is to use [Raspberry Pi Imager](https://www.screenly.io/blog/2022/12/13/anthias-and-screenly-now-in-rpi-imager/), where you can find Anthias under `Other specific-purpose OS`. Alternatively, you can find our pre-built disk images (powered by [Balena Hub](https://hub.balena.io/)) [here](https://github.com/Screenly/Anthias/releases/latest/).

Do however note that that we are still in the process of knocking out some bugs. You can track the known issues [here](https://github.com/Screenly/Anthias/projects/8).

## Installing on Raspbian/Raspberry Pi OS

The tl;dr for on [Raspberry Pi OS](https://www.raspberrypi.com/software/) Bullseye Lite is:

```
$ bash <(curl -sL https://install-anthias.srly.io)
```

If you've selected **_N_** when prompted for an upgrade &ndash; i.e., "Would you like to perform a full system upgrade as well? (y/N)"
&ndash; you'll get the following message when the installer is almost done executing:

```
"Please reboot and run /home/$USER/screenly/bin/upgrade_containers.sh to complete the installation. Would you like to reboot now? (y/N)"
```

You have the option to reboot now or later. On the next boot, make sure to run
`upgrade_containers.sh`, as mentioned above.

**This installation will take 15 minutes to several hours**, depending on variables such as:

 * The Raspberry Pi hardware version
 * The SD card
 * The internet connection

During ideal conditions (Raspberry Pi 3 Model B+, class 10 SD card and fast internet connection), the installation normally takes 15-30 minutes. On a Raspberry Pi Zero or Raspberry Pi Model B with a class 4 SD card, the installation will take hours. As such, it is usually a lot faster to use the provided disk images.

## Installing with Balena

While you can deploy to your own Balena fleet, the easiest way to deploy using [Balena OpenFleets](https://hub.balena.io/organizations/screenly_ose/fleets).

## Quick links

 * [Forum](https://forums.screenly.io/c/screenly-ose)
 * [Website](https://anthias.screenly.io) (hosted on GitHub and the source is available [here](https://github.com/Screenly/Anthias/tree/master/website))
 * [QA Checklist](https://github.com/Screenly/Anthias/blob/master/docs/qa-checklist.md)
 * [Developer Documentation](https://github.com/Screenly/Anthias/blob/master/docs/developer-documentation.md)

Anthias works on all Raspberry Pi versions, including Raspberry Pi Zero, Raspberry Pi 3 Model B, and Raspberry Pi 4 Model B.

## Dockerized Development Environment

To simplify development of the server module of Anthias, we've created a Docker container. This is intended to run on your local machine with the Anthias repository mounted as a volume.

Do note that Anthias is using Docker's [buildx](https://docs.docker.com/engine/reference/commandline/buildx/) for the image builds. This is used both for cross compilation as well as for local caching. You might need to run `docker buildx create --use` first.

Assuming you're in the source code repository, simply run:

```bash
$ ./bin/build_containers.sh
$ docker compose \
    -f docker-compose.dev.yml up
```

## Building Containers Locally

Make sure that you have `buildx` installed and that you have run
`docker buildx create --use` before you do the following:

```bash
$ ./bin/build_containers.sh
```

### Skipping Specific Services

Say that you would like to skip building the `anthias-viewer` and `anthias-nginx`
services. Just run the following:

```bash
$ SKIP_VIEWER=1 SKIP_NGINX=1 ./bin/build_containers.sh
```

### Generating Only Dockerfiles

If you'd like to just generate the Dockerfiles from the templates provided
inside the `docker/` directory, run the following:

```bash
$ DOCKERFILES_ONLY=1 ./bin_build_containers.sh
```

## Running the Unit Tests

Build and start the containers.

```bash
$ SKIP_SERVER=1 \
  SKIP_WEBSOCKET=1 \
  SKIP_NGINX=1 \
  SKIP_VIEWER=1 \
  SKIP_WIFI_CONNECT=1 \
  ./bin/build_containers.sh
$ docker compose \
    -f docker-compose.test.yml up -d
```

Run the unit tests.

```bash
$ docker compose \
    -f docker-compose.test.yml \
    exec -T anthias-test bash ./bin/prepare_test_environment.sh -s
$ docker-compose \
    -f docker-compose.test.yml \
    exec -T anthias-test nosetests -v -a '!fixme'
```
