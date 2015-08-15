FROM mhart/alpine-node

# This is where node_modules live on the system
ENV NODE_PATH /usr/lib/node_modules

# Install usefull libraries for integration testing
RUN npm install -g mocha
RUN npm install -g chai
RUN npm install -g babel
