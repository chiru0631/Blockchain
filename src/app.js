let web3, accounts, networkId;
let certificate, verifier, student;

document.getElementById("connectBtn").addEventListener("click", connectWallet);
document.getElementById("studentBtn").addEventListener("click", () => showUI("student"));
document.getElementById("verifierBtn").addEventListener("click", () => showUI("verifier"));
document.getElementById("registerBtn").addEventListener("click", registerStudent);
document.getElementById("viewCertBtn").addEventListener("click", viewCertificates);
document.getElementById("issueBtn").addEventListener("click", issueCertificate);

async function connectWallet() {
  if (!window.ethereum) return alert("Please install MetaMask");

  web3 = new Web3(window.ethereum);
  await window.ethereum.request({ method: 'eth_requestAccounts' });
  accounts = await web3.eth.getAccounts();
  networkId = await web3.eth.net.getId();

  await loadContracts();

  document.getElementById("roleSection").style.display = "block";
}

async function loadContracts() {
  const certJson = await fetch("./abi/Certificate.json").then(r => r.json());
  const verifierJson = await fetch("./abi/Verifier.json").then(r => r.json());
  const studentJson = await fetch("./abi/Student.json").then(r => r.json());

  certificate = new web3.eth.Contract(certJson.abi, certJson.networks[networkId].address);
  verifier = new web3.eth.Contract(verifierJson.abi, verifierJson.networks[networkId].address);
  student = new web3.eth.Contract(studentJson.abi, studentJson.networks[networkId].address);
}

function showUI(role) {
  document.getElementById("studentUI").style.display = role === "student" ? "block" : "none";
  document.getElementById("verifierUI").style.display = role === "verifier" ? "block" : "none";
}

async function registerStudent() {
  await student.methods.register().send({ from: accounts[0] });
  alert("Registered successfully!");
}

async function viewCertificates() {
  const certs = await certificate.methods.getCertificates(accounts[0]).call();
  const list = document.getElementById("studentCerts");
  list.innerHTML = "";
  certs.forEach(c => {
    const li = document.createElement("li");
    li.innerHTML = `${c.studentName} - ${c.subject} - <a href="https://ipfs.io/ipfs/${c.ipfsHash}" target="_blank">View</a>`;
    list.appendChild(li);
  });
}

async function issueCertificate() {
  const addr = document.getElementById("vAddr").value;
  const name = document.getElementById("vName").value;
  const subject = document.getElementById("vSubject").value;
  const ipfs = document.getElementById("vHash").value;

  await verifier.methods.issueCertificateToStudent(addr, name, subject, ipfs).send({ from: accounts[0] });
  alert("Certificate Issued");
}
