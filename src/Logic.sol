// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./LendToken.sol";
contract Logic is LToken {
    LToken lendToken;
    struct BorrowParam{
        address Borrower;
        uint256 Borrowamount;
        uint256 Liquidation;
        uint256 Interest;
        uint256 Duration;
        uint256 InterestRate;
        uint256 totalSupplyOfBorrowShare;
    }
    struct LendParam{
        uint256 Lendamount;
        address Lender;
        uint256 Duration;
        uint256 InterestRate;
    }
    mapping(address => BorrowParam) public borrowParams;
    mapping(address => LendParam) public lendParams;

    function Borrow(BorrowParam _BorrowParam) public returns(uint256){
        require(_BorrowParam.Borrowamount > 0, "Borrow amount must be greater than 0");
        lendToken.mint(_BorrowParam.Borrower, _BorrowParam.Borrowamount);
        borrowParams[_BorrowParam.Duration] = block.timestamp; 

        
       
    }
    function Lend(LendParam _Lendamount) public returns(uint256){
        require(_Lendamount.Lendamount > 0, "Lend amount must be greater than 0");
    }

    function getBorrowAmount(uint256 _Borrowamount) public view returns(uint256){
        return _Borrowamount;
    }
    function getLendAmount(uint256 _Lendamount) public view returns(uint256){
        
    }

    function repayBorrow(uint256 _Repayamount) public returns(uint256){
        require(_Repayamount > 0, "Repay amount must be greater than 0");
        
    }
    function withdrawLend(uint256 _Withdrawamount) public returns(uint256){

    }

    function accrueInterest() public view returns(uint256){
        
    }
    
}
