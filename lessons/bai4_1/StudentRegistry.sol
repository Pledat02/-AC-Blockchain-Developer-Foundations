// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract StudentRegistry{
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }
    mapping(address => Student) public students;
    error AlreadyRegistered();
    error InvalidName(string name);
    error InvalidAge(uint age);

   
   function register(string memory name, uint age) public {
        if (isStudentRegistered(msg.sender))
         revert AlreadyRegistered();
        if (bytes(name).length < 3 || bytes(name).length > 100) 
        revert InvalidName(name);
        students[msg.sender] = Student(name, age, true); 
   }
   function getStudent(address user) public view returns (Student memory){
        return students[user];
   }
   function isStudentRegistered(address user) public view returns (bool){
        return students[user].isRegistered;
   }

}