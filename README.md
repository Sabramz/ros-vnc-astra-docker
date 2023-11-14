RUN THESE COMMANDS IN YOUR TERMINAL IN THIS DIRECTORY

docker build -tag astra .

! Set a source container for your volume mount.

docker run -itd -p 5900:5900 --name astra --mount source=[YOUR VOLUME HERE],target=/root astra bash

docker exec -it astra bash
