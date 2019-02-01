FROM registry.access.redhat.com/rhscl/nodejs-6-rhel7
EXPOSE 8080:8080
RUN mkdir -p /opt/app-root/ \
    chgrp -R 0 /home/pradeepkumar/git/nodejs-ex && \
    chmod -R g=u /home/pradeepkumar/git/nodejs-ex
WORKDIR /opt/app-root
ONBUILD COPY package.json /opt/app-root
ONBUILD RUN npm install
ONBUILD COPY /home/pradeepkumar/git/nodejs-ex /opt/app-root
CMD [ "npm", "start" ]