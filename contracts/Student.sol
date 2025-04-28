// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    struct CertificateRequest {
        address student;
        string studentName;
        string subject;
        string ipfsHash;
        bool isApproved;
    }

    struct Info {
        bool isRegistered;
    }

    mapping(address => Info) public students;
    CertificateRequest[] public certificateRequests;

    function register() public {
        students[msg.sender] = Info(true);
    }

    function requestCertificate(string memory name, string memory subject, string memory ipfsHash) public {
        require(students[msg.sender].isRegistered, "You must register first");
        certificateRequests.push(CertificateRequest(msg.sender, name, subject, ipfsHash, false)); // Default is not approved
    }

    function getAllRequests() public view returns (CertificateRequest[] memory) {
        return certificateRequests;
    }

    // Function to approve a request
    function approveRequest(uint index) public {
        require(index < certificateRequests.length, "Request not found");
        certificateRequests[index].isApproved = true;
    }

    // New function to get the student's approved requests
    function getApprovedRequests(address student) public view returns (CertificateRequest[] memory) {
        uint count = 0;
        for (uint i = 0; i < certificateRequests.length; i++) {
            if (certificateRequests[i].student == student && certificateRequests[i].isApproved) {
                count++;
            }
        }

        CertificateRequest[] memory approvedRequests = new CertificateRequest[](count);
        uint j = 0;
        for (uint i = 0; i < certificateRequests.length; i++) {
            if (certificateRequests[i].student == student && certificateRequests[i].isApproved) {
                approvedRequests[j] = certificateRequests[i];
                j++;
            }
        }
        return approvedRequests;
    }
}
