# if you're doing anything beyond your local machine, please pin this to a specific version at https://hub.docker.com/_/node/
FROM node:8

RUN mkdir -p /opt/app

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# default to port 80 for node, and 5858 or 9229 for debug
ARG PORT=80
ENV PORT $PORT
EXPOSE $PORT 5858 9229

# copy in our source code last, as it changes the most
WORKDIR /opt/app
COPY . /opt/app
RUN npm install && npm cache clean --force

# Runing App
CMD [ "node", "app.js" ]
