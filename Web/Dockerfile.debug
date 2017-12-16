FROM microsoft/aspnetcore:latest
RUN mkdir app

#Install debugger
RUN apt-get update
RUN apt-get install curl -y unzip
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg

EXPOSE 80/tcp 
WORKDIR app

#Keep the debugger container on
ENTRYPOINT ["tail", "-f", "/dev/null"]