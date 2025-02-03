# Etapa 1: Construcción
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copiar archivos de proyecto
COPY *.csproj ./

# Restaurar dependencias
RUN dotnet restore

# Copiar el resto del código
COPY . ./

# Publicar en modo Release
RUN dotnet publish -c Release -o /app

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/runtime:7.0 AS final
WORKDIR /app

# Copiamos la aplicación publicada desde la etapa anterior
COPY --from=build /app ./

# Definir el punto de entrada
ENTRYPOINT ["dotnet", "SumaFibonacci.dll"]

