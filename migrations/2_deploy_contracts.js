const Certificate = artifacts.require("Certificate");
const Student = artifacts.require("Student");
const Verifier = artifacts.require("Verifier");

module.exports = async function(deployer) {
  await deployer.deploy(Certificate);
  const certificateInstance = await Certificate.deployed();

  await deployer.deploy(Student);
  const studentInstance = await Student.deployed();

  await deployer.deploy(Verifier, certificateInstance.address, studentInstance.address);
};
