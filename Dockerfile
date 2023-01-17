FROM golang

ENV MAINDIR /home

WORKDIR $MAINDIR

RUN curl https://raw.githubusercontent.com/NeelRanka/dockerScripts/main/installer_docker.sh | bash

EXPOSE 4444

CMD ["bash", "start.sh"]
