#!/usr/bin/env bash
set -e
echo "🚀 Starting .NET 8 build for UserService.API..."

# 1️⃣ Install .NET SDK (Render Node environment)
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0

# 2️⃣ Add .NET to PATH for this build session
export PATH=$PATH:$HOME/.dotnet

# 3️⃣ Show .NET info for debugging
dotnet --info

# 4️⃣ Restore dependencies
dotnet restore UserService.sln

# 5️⃣ Publish the API as a self-contained app (includes runtime)
dotnet publish UserService.API -c Release -r linux-x64 --self-contained true -p:PublishTrimmed=false -o out

echo "✅ Build and publish completed successfully."
