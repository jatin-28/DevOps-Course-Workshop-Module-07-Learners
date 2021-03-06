FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash - apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
COPY * /app/

RUN build

WORKDIR /DotnetTemplate.Web/app

RUN npm install
RUN npm run build

ENTRYPOINT ['dotnet', 'run']
