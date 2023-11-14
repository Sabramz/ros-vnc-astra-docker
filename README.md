RUN THESE COMMANDS IN YOUR TERMINAL IN THIS DIRECTORY

docker build -tag astra .

docker run -itd -p 5900:5900 --name astra --mount source=astra,target=/root astra bash

docker exec -it astra bash
