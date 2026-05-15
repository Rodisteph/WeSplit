//
//  BillCalculator.swift
//  WeSplit
//
//  Created by Bouabida Rodrigo on 14/05/2026.
//

struct BillCalculator {
    /// - Parameters:
    ///   - checkAmount: montant total de la note
    ///   - numberOfPeople: index du Picker (0 → 2 personnes, 1 → 3 personnes, …)
    ///   - tipPercentage: pourcentage de tip (0, 10, 15, 20, 25)
    /// - Returns: montant par personne
    static func totalPerPerson(checkAmount: Double,
                               numberOfPeople: Int,
                               tipPercentage: Int) -> Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        let grandTotal = checkAmount + tipValue
        return grandTotal / peopleCount
    }

    /// Montant total (avec tip)
    static func grandTotal(checkAmount: Double, tipPercentage: Int) -> Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        return checkAmount + tipValue
    }
}
