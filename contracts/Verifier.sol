// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Certificate.sol";
import "./Student.sol";

contract Verifier {
    Certificate public certificateContract;
    Student public studentContract;

    constructor(address _certAddress, address _studentAddress) {
        certificateContract = Certificate(_certAddress);
        studentContract = Student(_studentAddress);
    }

    function issueCertificateToStudent(address student, string memory name, string memory subject, string memory hash) public {
        certificateContract.addCertificate(student, name, subject, hash);
    }

    function getAllRequests() public view returns (Student.CertificateRequest[] memory) {
        return studentContract.getAllRequests();
    }
}
