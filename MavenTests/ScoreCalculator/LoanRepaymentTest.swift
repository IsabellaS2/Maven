//
//  LoanRepaymentTest.swift
//  Maven
//
//  Created by Isabella Sulisufi on 05/07/2025.
//

import XCTest
@testable import Maven

final class LoanRepaymentTest: XCTestCase {
    
    // MARK: - Always Consistent
    func testLoanRepaymentAlwaysConsistent() {
        let loan = Loan(
            provider: "Bank of Testing",
            amount: 5000.0,
            balanceRemaining: 3000.0,
            monthlyRepayment: 350.0,
            repaymentConsistency: "always_consistent"
        )
        
        let score = calculateLoanRepaymentConsistency(loan: loan)
        
        XCTAssertEqual(loan.repaymentConsistency, "always_consistent")
        XCTAssertEqual(score, 35)
    }
    
    // MARK: - Mostly Consistent
    func testLoanRepaymentMostlyConsistent() {
        let loan = Loan(
            provider: "Bank of Testing",
            amount: 5000.0,
            balanceRemaining: 3000.0,
            monthlyRepayment: 350.0,
            repaymentConsistency: "mostly_consistent"
        )
        
        let score = calculateLoanRepaymentConsistency(loan: loan)
        
        XCTAssertEqual(loan.repaymentConsistency, "mostly_consistent")
        XCTAssertEqual(score, 20)
    }
    
    // MARK: - Irregular
    func testLoanRepaymentIrregular() {
        let loan = Loan(
            provider: "Bank of Testing",
            amount: 5000.0,
            balanceRemaining: 3000.0,
            monthlyRepayment: 350.0,
            repaymentConsistency: "irregular"
        )
        
        let score = calculateLoanRepaymentConsistency(loan: loan)
        
        XCTAssertEqual(loan.repaymentConsistency, "irregular")
        XCTAssertEqual(score, 0)
    }
    
    // MARK: - Edge Cases
    
    func testLoanRepaymentEmptyConsistencyReturns15() {
        let loan = Loan(
            provider: "Bank of Testing",
            amount: 5000.0,
            balanceRemaining: 3000.0,
            monthlyRepayment: 350.0,
            repaymentConsistency: ""
        )
        
        let score = calculateLoanRepaymentConsistency(loan: loan)
        
        XCTAssertEqual(score, 15)
    }
    
    func testLoanRepaymentNilLoanReturns15() {
        let score = calculateLoanRepaymentConsistency(loan: nil)
        XCTAssertEqual(score, 15)
    }
    
    func testLoanRepaymentUnknownConsistencyReturns15() {
        let loan = Loan(
            provider: "Bank of Testing",
            amount: 5000.0,
            balanceRemaining: 3000.0,
            monthlyRepayment: 350.0,
            repaymentConsistency: "sometimes_consistent"
        )
        
        let score = calculateLoanRepaymentConsistency(loan: loan)
        
        XCTAssertEqual(score, 0)
    }
}
