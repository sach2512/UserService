#!/usr/bin/env bash
set -e
echo "🚀 Starting .NET 8 build for UserService.API..."

# 1️⃣ Install .NET 8 SDK (Render’s Node image doesn’t have it)
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0
export PATH=$PATH:$HOME/.dotnet

# 2️⃣ Show .NET info for debugging
dotnet --info

# 3️⃣ Restore dependencies for the whole solution
dotnet restore UserService.sln

# 4️⃣ Publish the API as a self-contained Linux build
dotnet publish UserService.API -c Release -r linux-x64 --self-contained true -p:PublishTrimmed=false -o out

echo "✅ Build and publish completed successfully."
