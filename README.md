# Kinoblue

My personal Fedora Kinoite + Silverblue image, soon to be a separate base image soon!

## Features

- Based on Fedora 41 and Universal Blue
- Provides a KDE Plasma environment with GNOME apps
- Applies my [dotfiles](https://git.gay/max/dotfiles)
- Makes AppImages work out of box
- Uses Inter and Cascadia Code as the UI fonts

## Running the image

### Rebasing to this image

> [!NOTE]
> 
> This section is to be filled out.

### Creating an ISO

> [!TIP]
> 
> This image auto-updates regularly when installed, so `rpm-ostree upgrade` isn't required for staying up-to-date.

```sh
sudo docker run --rm --privileged --volume .:/build-container-installer/build --security-opt label=disable --pull=newer \
    ghcr.io/jasonn3/build-container-installer:latest \
    IMAGE_REPO=ghcr.io/theycallhermax \
    IMAGE_NAME=kinoblue \
    IMAGE_TAG=latest \
    IMAGE_SIGNED=true \
    VERSION=41 \
    VARIANT=Silverblue
```

The output file will be `deploy.iso` file in the same directory you have ran the above command in.

## Testing the image

> [!CAUTION]
> 
> You are running the image **temporary storage** and is deleted when you shut down the container.

```sh
docker pull ghcr.io/theycallhermax/kinoblue:latest
docker run --privileged -it ghcr.io/theycallhermax/kinoblue:latest /usr/lib/systemd/systemd rhgb --system
```
