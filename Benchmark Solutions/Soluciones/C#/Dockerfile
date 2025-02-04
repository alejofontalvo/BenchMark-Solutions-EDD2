FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copiamos tu archivo fuente
COPY solve.cs .

# Crear un nuevo proyecto de consola con un nombre genérico (por ejemplo "temp")
RUN dotnet new console -n temp

# Borramos el Program.cs que se genera por defecto
RUN rm temp/Program.cs

# Movemos solve.cs al interior de la carpeta del proyecto (temp)
RUN mv solve.cs temp/

WORKDIR /app/temp

# Restauramos y publicamos
RUN dotnet restore
RUN dotnet publish -c Release -o out  # <---- RUTA RELATIVA: "out", sin "/"

# --------------------
# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /app

# Copiamos el contenido que se generó en /app/temp/out
COPY --from=build /app/temp/out .
ENTRYPOINT ["dotnet", "temp.dll"]

