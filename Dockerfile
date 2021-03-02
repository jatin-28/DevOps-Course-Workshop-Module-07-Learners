FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
COPY . /app/

RUN dotnet build

WORKDIR /app/DotnetTemplate.Web

RUN npm install
RUN npm run build

ENTRYPOINT ['dotnet', 'run']
