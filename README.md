# ASPNETCoreDockerMicroservices
Sample project for getting off the ground with ASP.NET Core, Docker and Microservices based on the tutorial: https://fullstackmark.com/post/12/get-started-building-microservices-with-asp.net-core-and-docker-in-visual-studio-code

This repo contains the demo project used as the subject for a blog post I did on getting started with ASP.NET Core-based microservices and Docker.  If you just want to run the project please follow instructions below.  If you'd like to learn more on how it was built please check out this [detailed guide on my blog](https://fullstackmark.com/post/12/get-started-building-microservices-with-asp.net-core-and-docker-in-visual-studio-code).


# Environment
It should be fairly cross-platform friendly to get up and running but was developed on my windows 10 machine along with the following:

- Windows 10 and PowerShell
- Visual Studio Code - v1.19.0
    - C# for Visual Studio Code extension
    - Docker extension
 - SQL Server Management Studio 17.4
- .NET Core SDK v2.0.0
- Docker Community Edition 17.09.1-ce-win42 using Linux containers

# Setup

1. Download/clone repo.

2. From the root folder (where _docker-compose.yml_ resides) use the Docker CLI to build and start the containers for the solution: `PS> docker-compose up -d`.  This step will take a few minutes or more as all the base images must be downloaded.  When it completes you can check that all **7** containers for the solution have been built and started successfully by running `PS> docker ps`.
![Alt](https://fullstackmark.com/img/posts/12/aspnetcore-microservice-and-service-docker-containers.png "7 containers are deployed in this solution") Additionally, you can connect to the Sql Server on Linux instance in the container using SQL Server Management Studio to ensure the databases **dotnetgigs.applicants** and **dotnetgigs.jobs** were created.  The server name is: **localhost,5433** with username **sa** and password **Pass@word**.

3. At this point, you can run and debug the solution from Visual Studio Code.  Simply open the root folder in VSCode and start all projects in the solution simultaneously using the _All Projects_ configuration or start them individually.  The order they're started does not matter. ![Alt](https://fullstackmark.com/img/posts/12/aspnetcore-services-running-in-visual-studio-code-debugger.png "containerized services running in visual studio code debugger")

4. With all services running in the debugger you can hit the web app in your browser at **localhost:8080** and set breakpoints in any of the projects to debug directly.

# Known Issues

When running on windows ensure the line ending type for the <a href="https://github.com/mmacneil/ASPNETCoreDockerMicroservices/blob/master/Database/SqlCmdStartup.sh" target="_blank">Database/SqlCmdStartup.sh</a> remains as `LF`.  When opening/saving this file in VSCode it can get switched to `CRLF` in which case the script won't run and the required databases never get created.  If the databases aren't created check `PS> docker logs mssql-linux` and the presence of an error at the top such as _sleep: invalid time interval '25\r'_.

I have also noticed, on first run of newly created containers that when starting services that use Rabbit a connection exception will be thrown when starting the project in the debugger for the first time.  Start it again and things seem to work fine from then on.





