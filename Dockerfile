FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14

RUN mkdir /project

WORKDIR /project

VOLUME ["/project"]

CMD [ "tail", "-f", "/dev/null" ]