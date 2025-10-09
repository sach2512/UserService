#!/usr/bin/env bash
set -e
echo "🚀 Starting .NET 8 build for UserService.API..."

# Install .NET
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0
export PATH=$PATH:$HOME/.dotnet
dotnet --info

# ✅ Move into the correct directory where the .sln is located
cd src

# Restore and publish
dotnet restore UserService.sln
dotnet publish UserService.API -c Release -r linux-x64 --self-contained true -p:PublishTrimmed=false -o out

echo "✅ Build and publish completed successfully."
