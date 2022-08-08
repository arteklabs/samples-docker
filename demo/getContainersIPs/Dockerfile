# build with:
#
# $ docker build . -t demo
# Sending build context to Docker daemon  3.072kB
# Step 1/3 : ...
# ...
# Successfully built f5ec734f0d16
# Successfully tagged demo:latest
# 
# run with:
#
# $ docker run demo
# Server running at http://0.0.0.0:3000/
# 
# stop with:
#
# $ docker stop 012a0f5aae62
FROM node:18
RUN apt update
RUN apt install -y iproute2
COPY app.js .
ENTRYPOINT [ "node", "app.js" ]