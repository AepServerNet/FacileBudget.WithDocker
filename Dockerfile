FROM ubuntu:20.04

USER root

RUN apt update
RUN apt install -y wget vim
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
 
RUN apt update
RUN apt install -y apt-transport-https dotnet-sdk-3.1 aspnetcore-runtime-3.1

ENV ASPNETCORE_URLS=http://*:5004
ENV ASPNETCORE_ENVIRONMENT=”production”

EXPOSE 5004
WORKDIR /app
ENTRYPOINT ["dotnet", "FacileBudget.dll"]
