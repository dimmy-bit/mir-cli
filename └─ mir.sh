#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Reset

clear

# Animated Banner
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
echo

# Function for menu
show_menu() {
  echo -e "${GREEN}Please select an option:${NC}"
  echo "1) Fund Wallet"
  echo "2) Check Balance"
  echo "3) Upload File"
  echo "4) Exit"
  echo
  read -p "Enter choice [1-4]: " choice
}

# Gather common inputs once
read -p "Network (default: devnet): " NETWORK
NETWORK=${NETWORK:-devnet}

read -p "Token (e.g. ethereum): " TOKEN
read -s -p "Private Key (hidden input): " PRIVATE_KEY
echo
read -p "Provider URL (RPC): " PROVIDER_URL
echo

# Menu loop
while true; do
  show_menu
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
  echo
done
