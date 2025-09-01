#!/bin/bash

# -------------------------------
# MIR CLI - One-Click Installer
# -------------------------------

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Reset

clear

echo -e "${CYAN}=== MIR CLI - One-Click Installer ===${NC}"

# === 1. Install Required Dependencies ===
echo -e "${YELLOW}Installing all required dependencies...${NC}"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install curl iptables build-essential git wget lz4 jq make protobuf-compiler cmake gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev screen ufw -y

# === 2. Install Node.js & IRYS CLI ===
echo -e "${YELLOW}Checking Node.js & IRYS CLI...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${GREEN}Installing Node.js & npm...${NC}"
    sudo apt install nodejs npm -y
fi

if ! command -v irys &> /dev/null; then
    echo -e "${GREEN}Installing IRYS CLI...${NC}"
    npm install -g @irys/cli || { echo -e "${RED}IRYS CLI install failed! Exiting.${NC}"; exit 1; }
fi

# === 3. Animated Banner ===
clear
echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║                                      ║"
echo "║      ██████╗ ██╗██████╗ ██╗   ██╗     ║"
echo "║     ██╔═══██╗██║██╔══██╗╚██╗ ██╔╝     ║"
echo "║     ██║   ██║██║██████╔╝ ╚████╔╝      ║"
echo "║     ██║   ██║██║██╔═══╝   ╚██╔╝       ║"
echo "║     ╚██████╔╝██║██║        ██║        ║"
echo "║      ╚═════╝ ╚═╝╚═╝        ╚═╝        ║"
echo "║                                      ║"
echo "║     IRYS CLI | Created by MIR        ║"
echo "║                                      ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"
sleep 1
echo -e "${YELLOW}Welcome to MIR’s One-Click IRYS CLI 🚀${NC}"
sleep 1

# === 4. Gather User Inputs ===
read -p "Network (default: devnet): " NETWORK
NETWORK=${NETWORK:-devnet}

read -p "Token (e.g., ethereum): " TOKEN
read -s -p "Private Key (hidden input): " PRIVATE_KEY
echo
read -p "Provider URL (RPC): " PROVIDER_URL
echo

# === 5. Interactive Menu ===
while true; do
  echo -e "${GREEN}\nPlease select an option:${NC}"
  echo "1) Fund Wallet"
  echo "2) Check Balance"
  echo "3) Upload File"
  echo "4) Exit"
  read -p "Enter choice [1-4]: " choice

  case $choice in
    1)
      read -p "Enter amount to fund (wei): " FUND_AMOUNT
      echo -e "${CYAN}→ Funding wallet...${NC}"
      irys fund "$FUND_AMOUNT" -n "$NETWORK" -t "$TOKEN" -w "$PRIVATE_KEY" --provider-url "$PROVIDER_URL"
      ;;
    2)
      echo -e "${CYAN}→ Checking balance...${NC}"
      irys balance "$PRIVATE_KEY" -t "$TOKEN" -n "$NETWORK" --provider-url "$PROVIDER_URL"
      ;;
    3)
      read -p "File to upload (path): " FILE
      if [ ! -f "$FILE" ]; then
        echo -e "${RED}File not found!${NC}"
        continue
      fi
      read -p "File format (e.g., PNG, JPG): " FILE_FORMAT
      echo -e "${CYAN}→ Uploading file...${NC}"
      irys upload "$FILE" -n "$NETWORK" -t "$TOKEN" -w "$PRIVATE_KEY" --tags "$(basename "$FILE")" "$FILE_FORMAT" --provider-url "$PROVIDER_URL"
      ;;
    4)
      echo -e "${YELLOW}Goodbye from MIR’s CLI ✨${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid option! Please try again.${NC}"
      ;;
  esac
done
