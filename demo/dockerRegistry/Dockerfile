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
# $ docker run -p 0.0.0.0:3000:3000 --name=node-1 node-1 &
# Server 'node-default' running at http://0.0.0.0:3000/
# $ docker run -p 0.0.0.0:3000:3000 --name=node-1 node-1 node-1 3000 &
# Server 'node-1' running at http://0.0.0.0:3000/
#
# test with:
# 
# $ curl http://0.0.0.0:3000/
# server 'node-1' says 'hello!'
#
# stop with:
#
# $ docker stop node-1
FROM node:18
COPY app.js .
RUN apt update
RUN apt install nano
ENTRYPOINT [ "node", "app.js" ]
CMD ["node-default", "3000"]