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
# $ docker run -p 0.0.0.0:3000:3000 demo-ips
# Server 'node-default' running at http://0.0.0.0:3000/
# $ docker run -p 0.0.0.0:3000:3000 demo-ips node-1
# Server 'node-1' running at http://0.0.0.0:3000/
#
# test with:
# 
# $ curl http://0.0.0.0:3000/
# server 'node-1' says 'hello!'
#
# stop with:
#
# $ docker stop 012a0f5aae62
FROM node:18
RUN apt update
RUN apt install -y iproute2
COPY app.js .
ENTRYPOINT [ "node", "app.js" ]
CMD ["node-default"]