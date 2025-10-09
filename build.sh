#!/usr/bin/env bash
set -e  # exit on any failure

# Install .NET
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0

# Add .NET to PATH
export PATH=$PATH:$HOME/.dotnet

# Restore and publish
dotnet restore UserService.API
dotnet publish UserService.API -c Release -o out
