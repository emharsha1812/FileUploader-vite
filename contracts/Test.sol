// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


//Structure are user defined data types that can be used to group items of possibly different data types into a single type
struct FileData {
    string fileURL;
    string fileName;
    address fileOwner;
    string ownerName;
}
 //contract is container where we write our code.
//Each contract have it's own address.
//if we have contract address and abi we can iteract with it.
contract Test {
    address public owner;
    uint public count;
    
    //Dynamic Array declared
    // For inserting elements in the dynamic size array we have push function
    FileData[] FileArray;

    event FileUploaded(
        string fileURL,
        string fileName,
        address fileOwner,
        string ownerName
    );

    constructor(){
        count=0;
        owner = msg.sender;
    }
    
    
    function addFile(string memory _fileURL, string memory _fileName, address _fileOwner, string memory _ownerName) public payable{
        FileArray.push(FileData(_fileURL, _fileName, _fileOwner, _ownerName));
        emit FileUploaded(_fileURL, _fileName, _fileOwner, _ownerName);
        count++;
    }
    
    
    function getData(uint x) public view returns(FileData memory){
        return FileArray[x];
    }
    
    
    function getCount() public view returns(uint){
        return count;
    }
}
