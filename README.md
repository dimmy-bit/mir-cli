# mir-cli
# 🚀 MIR CLI — One-Click IRYS Storage Manager  

[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)  
[![IRYS](https://img.shields.io/badge/Powered%20by-IRYS-blue.svg)](https://docs.irys.xyz)  

MIR CLI is a **one-click interactive CLI tool** for managing your storage on [IRYS](https://irys.xyz).  
It provides a **colorful animated interface**, simple menu navigation, and automates **funding, balance check, and file upload**.

---

## ✨ Features
- 🎨 **Animated Banner** + colorized output  
- 🔑 **Secure private key input** (hidden)  
- 💸 **Fund your wallet** directly  
- 💰 **Check wallet balance**  
- 📤 **Upload files** with tags  
- 🚀 Runs in **GitHub Codespaces** or any Linux environment  

---

## 🔧 Installation

### 1. Clone Repo
```bash
git clone https://github.com/<username>/mir-cli.git
cd mir-cli


2️⃣ Install IRYS CLI
npm install -g @irys/cli


Verify installation:

irys 


3️⃣ Make MIR CLI Script Executable
chmod +x mir.sh

▶️ Usage — First Time Flow

Run the script:

./mir.sh


Step 1: Welcome Banner
=======================================
     Welcome to MIR | Create your MIR
=======================================

Step 2: Network & Token

Prompts you will see:

Network (default: devnet):


Press Enter → uses devnet by default

Or type sepolia → Ethereum Sepolia testnet

Token (e.g., ethereum):


Always type: ethereum

Private Key (hidden input):
Paste your wallet private key (hidden)

java
Copy code
Provider URL (RPC):
Example for Sepolia: https://sepolia.infura.io/v3/<YOUR_PROJECT_ID>

Devnet: your IRYS devnet provider URL

Step 3: Fund Wallet
Menu appears:

mathematica
Copy code
1) Fund Wallet
2) Check Balance
3) Upload File
4) Exit
Enter 1 → Fund Wallet

Amount (wei) prompt:

Enter amount to fund (wei):
Example for easy testing: 1000000

CLI executes:

Copy code
→ Funding wallet...
Transaction sent! ✅
Your wallet is now funded on devnet/sepolia.

Step 4: Check Balance
Menu → Enter 2

CLI executes:

→ Checking balance...
Balance: 1000000 wei (or 1 ETH equivalent)
If it shows 0 → run npm rebuild to fix native bindings.

Step 5: Upload File
Menu → Enter 3

File path prompt:

pgsql
Copy code
File to upload (path):
Example: flame.png (file must exist in repo root)

File format prompt:

arduino
Copy code
File format (e.g., PNG, JPG):
Example: PNG

CLI executes:

arduino
Copy code

→ Uploading file...
File uploaded successfully! ✅
Step 6: Exit
Menu → Enter 4

CLI prints:

csharp
Copy code
Goodbye from MIR’s CLI ✨


