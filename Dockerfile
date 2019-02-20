FROM node:latest

RUN npm install pm2 -g

#部署代码
#在容器内创建/vue-hackernews目录
RUN mkdir -p /vue-hackernews
WORKDIR /vue-hackernews
COPY ./package.json /vue-hackernews/
#COPY ./package-lock.json /vue-hackernews/
RUN npm install
COPY . /vue-hackernews
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=8080
RUN npm run build

EXPOSE 8080

CMD ["pm2-runtime","/vue-hackernews/server.js"]
