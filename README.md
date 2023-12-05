RUN THESE COMMANDS IN YOUR TERMINAL IN THIS DIRECTORY

docker build -t astra .

! Set a source container for your volume mount.

docker run -d -p 5900:5900 --name astra --mount source=[YOUR VOLUME HERE],target=/root astra

docker exec -it astra bash
