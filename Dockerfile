FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app
COPY HelloDotnet5Kubernetes/HelloDotnet5Kubernetes.csproj .
RUN dotnet restore HelloDotnet5Kubernetes.csproj
COPY ./HelloDotnet5Kubernetes .
RUN dotnet build HelloDotnet5Kubernetes.csproj -c Release -o /out
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /out ./
ENTRYPOINT ["dotnet", "HelloDotnet5Kubernetes.dll"]