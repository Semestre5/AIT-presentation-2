# The base image is one of the offical one
FROM node:latest

LABEL Axel Vallon <axel.vallon@heig-vd.ch>
LABEL Robin Gaudin <robin.gaudin@heig-vd.ch>
LABEL Lev Pozniakoff <lev.pozniakoff@heig-vd.ch>
LABEL Nicolas Viotti <nicola.viotto@heig-vd.ch>

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

CMD [ "node", "index.js" ]