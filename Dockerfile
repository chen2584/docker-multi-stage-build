FROM mcr.microsoft.com/dotnet/sdk:7.0.201-alpine3.17 AS builder
WORKDIR /app
COPY . .
RUN dotnet restore "src/MyApi/MyApi.csproj"
RUN dotnet build "src/MyApi/MyApi.csproj" -c Release -o build

FROM mcr.microsoft.com/dotnet/aspnet:7.0.3-alpine3.16
WORKDIR /app
COPY --from=builder /app/build .
ENTRYPOINT [ "dotnet", "MyApi.dll", "--urls=http://0.0.0.0:5000" ]