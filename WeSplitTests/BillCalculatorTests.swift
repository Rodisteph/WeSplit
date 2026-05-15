//
//  BillCalculatorTests.swift
//  WeSplitTests
//
//  Created by Bouabida Rodrigo on 14/05/2026.
//

import XCTest
@testable import WeSplit

final class BillCalculatorTests: XCTestCase {

    // MARK: - totalPerPerson

    /// 100 € / 2 personnes / 0 % tip → 50 €
    func test_totalPerPerson_noTip_twoPeople() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 100,
            numberOfPeople: 0,   // index 0 → 2 personnes
            tipPercentage: 0
        )
        XCTAssertEqual(result, 50.0, accuracy: 0.001)
    }

    /// 100 € / 2 personnes / 20 % tip → 60 €
    func test_totalPerPerson_20Tip_twoPeople() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 100,
            numberOfPeople: 0,
            tipPercentage: 20
        )
        XCTAssertEqual(result, 60.0, accuracy: 0.001)
    }

    /// 100 € / 4 personnes / 10 % tip → 27.50 €
    func test_totalPerPerson_10Tip_fourPeople() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 100,
            numberOfPeople: 2,   // index 2 → 4 personnes
            tipPercentage: 10
        )
        XCTAssertEqual(result, 27.5, accuracy: 0.001)
    }

    /// 200 € / 3 personnes / 15 % tip → 76.666…
    func test_totalPerPerson_15Tip_threePeople() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 200,
            numberOfPeople: 1,   // index 1 → 3 personnes
            tipPercentage: 15
        )
        XCTAssertEqual(result, 230.0 / 3.0, accuracy: 0.001)
    }

    /// 0 € / n'importe → 0 €
    func test_totalPerPerson_zeroAmount() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 0,
            numberOfPeople: 3,
            tipPercentage: 25
        )
        XCTAssertEqual(result, 0.0, accuracy: 0.001)
    }

    /// 50 € / 2 personnes / 25 % tip → 31.25 €
    func test_totalPerPerson_25Tip_twoPeople() {
        let result = BillCalculator.totalPerPerson(
            checkAmount: 50,
            numberOfPeople: 0,
            tipPercentage: 25
        )
        XCTAssertEqual(result, 31.25, accuracy: 0.001)
    }

    // MARK: - grandTotal

    /// 100 € / 0 % tip → 100 €
    func test_grandTotal_noTip() {
        XCTAssertEqual(BillCalculator.grandTotal(checkAmount: 100, tipPercentage: 0), 100.0, accuracy: 0.001)
    }

    /// 80 € / 10 % tip → 88 €
    func test_grandTotal_10Tip() {
        XCTAssertEqual(BillCalculator.grandTotal(checkAmount: 80, tipPercentage: 10), 88.0, accuracy: 0.001)
    }

    /// 200 € / 20 % tip → 240 €
    func test_grandTotal_20Tip() {
        XCTAssertEqual(BillCalculator.grandTotal(checkAmount: 200, tipPercentage: 20), 240.0, accuracy: 0.001)
    }

    /// 0 € / 25 % tip → 0 €
    func test_grandTotal_zeroAmount() {
        XCTAssertEqual(BillCalculator.grandTotal(checkAmount: 0, tipPercentage: 25), 0.0, accuracy: 0.001)
    }
}
