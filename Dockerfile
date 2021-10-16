FROM node:8-slim
RUN apt-get update && \
    apt-get -y --no-install-recommends install git && \
    git clone --depth 1 https://github.com/Akkadius/glass-isc-dhcp.git /opt/glass
WORKDIR /opt/glass
RUN mkdir logs && chmod u+x ./bin/ -R && chmod u+x *.sh && npm install
COPY glass_config.json /opt/glass/config/glass_config.json
VOLUME /data
EXPOSE 3000
ENTRYPOINT ["npm", "start"]
