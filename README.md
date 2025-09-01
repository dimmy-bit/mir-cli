# mir-cli
# 🚀 MIR CLI — One-Click IRYS Storage Manager  

  

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

Install All Required Dependencies

Run the following commands to install everything needed for MIR CLI:

sudo apt-get update && sudo apt-get upgrade -y

sudo apt install curl iptables build-essential git wget lz4 jq make protobuf-compiler cmake gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev screen ufw -y


## 🔧 Installation

### 1. Clone Repo
```bash
git clone https://github.com/dimmy-bit/mir-cli
cd mir-cli


2. **Install IRYS CLI**
```markdown
## 2️⃣ Install IRYS CLI

```bash
npm install -g @irys/cli
irys 

3️⃣ Make Script Executable
chmod +x mir.sh

4️⃣ Run MIR CLI
./mir.sh


Expected Banner:

=======================================
     Welcome to MIR | Create your MIR
=======================================

5️⃣ Select Network & Token
Network (default: devnet):


Press Enter → devnet (default)

Or type sepolia → Ethereum Sepolia testnet

Token (e.g., ethereum):


Type: ethereum

Private Key (hidden input):


Paste your wallet private key

Provider URL (RPC):


Example Sepolia: https://sepolia.infura.io/v3/<YOUR_PROJECT_ID>

Devnet: IRYS devnet RPC


6️⃣ Fund Wallet

Menu:

1) Fund Wallet
2) Check Balance
3) Upload File
4) Exit


Enter 1 → Fund Wallet

Enter amount to fund (wei):


Type: 1000000

Expected Output:

→ Funding wallet...
Transaction sent! ✅


7️⃣ Check Balance

Menu → Enter 2

Expected Output:

→ Checking balance...
Balance: 1000000 wei


⚠️ Note: Agar 0 dikhe → run npm rebuild for native bindings.

8️⃣ Upload File

Menu → Enter 3

File to upload (path):


Example: flame.png (must exist in repo root)

File format (e.g., PNG, JPG):
Example: PNG

Expected Output:

arduino
Copy code
→ Uploading file...
File uploaded successfully! ✅
9️⃣ Exit CLI
Menu → Enter 4

Expected Output:

csharp
Copy code
Goodbye from MIR’s CLI ✨
