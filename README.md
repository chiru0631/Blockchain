# 🎓 Student Certificate Verification using Blockchain

## 📜 About
This project provides a decentralized solution for **student certificate verification** using **Blockchain technology**.  
It ensures certificates are authentic, tamper-proof, and easily verifiable without relying on centralized authorities.

## 🚀 Technologies Used
- **Solidity** — Smart contract programming
- **Truffle** — Smart contract development framework
- **Ganache** — Personal Ethereum blockchain for testing
- **Node.js** (optional, for running scripts/UI)

## 🛠️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/YourUsername/Blockchain.git
   cd Blockchain
   ```

2. **Install Truffle and Ganache**
   ```bash
   npm install -g truffle
   # Install Ganache from: https://trufflesuite.com/ganache/
   ```

3. **Start Ganache**  
   - Open Ganache GUI or use CLI (`ganache-cli`)  
   - Make sure it's running at `http://127.0.0.1:7545`

4. **Compile the Smart Contracts**
   ```bash
   truffle compile
   ```

5. **Deploy the Contracts**
   ```bash
   truffle migrate
   ```

6. **(Optional) Run Tests**
   ```bash
   truffle test
   ```

## 📄 Smart Contracts Included
- `Certificate.sol`
- `University.sol`
- `Verifier.sol`
- `Student.sol`

*(Each contract plays a role in managing certificates, universities, verifiers, and student data.)*

## 📢 Notes
- Make sure Ganache is running **before** deploying contracts.
- Contracts are deployed on a **local blockchain** (Ganache) but can be easily migrated to testnets like Rinkeby or Goerli.
- Future improvements could include adding a React.js frontend for easier certificate verification by users.

## 🤝 Contributing
Pull requests are welcome.  
For major changes, please open an issue first to discuss what you would like to change.

## 📜 License
This project is licensed under the **MIT License**.
