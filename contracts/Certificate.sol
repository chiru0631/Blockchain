// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Certificate {
    struct Cert {
        string studentName;
        string subject;
        string ipfsHash;
    }

    mapping(address => Cert[]) public issuedCertificates;

    function addCertificate(address student, string memory name, string memory subject, string memory hash) public {
        issuedCertificates[student].push(Cert(name, subject, hash));
    }

    function getCertificates(address student) public view returns (Cert[] memory) {
        return issuedCertificates[student];
    }
}
