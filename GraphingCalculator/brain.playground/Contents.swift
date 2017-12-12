////: Playground - noun: a place where people can play
//
//import UIKit
//
//precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
//infix operator ^^ : PowerPrecedence
//func ^^ (int: Double, power: Double) -> Double {
//    return Double(pow(Double(int), Double(power)))
//}
//
//class Brain{
//    var total = 0.0
//    var equation = ""
//    var partialEquation = [Any]()
//    var internalValue = 0.0
//    var internalError: String?
//    let formatter = NumberFormatter()
//
//    var isPartial: Bool{
//        get{
//            return binOp != nil
//        }
//    }
//
//    var description: String{
//        get{
//            if isPartial{
//                return binOp!.functionDesc(binOp!.firstDesc, binOp!.firstDesc != equation ? equation: "")
//            } else{
//                return equation
//            }
//        }
//    }
//
//    var errorReported: String{
//        get{
//            return internalError ?? ""
//        }
//    }
//
//    var result: Double{
//        get{
//            return total
//        }
//    }
//
//    //Brain Functions
//    //Types of data to be computed
//    enum Operation{
//        case Constant(Double)
//        case SingleOperation(function: (Double) -> Double,         description:(String) -> String,           error: ((Double) -> Bool)?)
//        case BinaryOperation(function: (Double, Double) -> Double, description:((String, String)) -> String, error: ((Double) -> Bool)?)
//        case Equals
//    }
//
//    var operations: [String:Operation] = [
//        "π" :  Operation.Constant(.pi),
//        "√" :  Operation.SingleOperation(function: sqrt,    description: {"√" + "(" + $0 + ")"},  error: {$0 > 0}),
//        "cos": Operation.SingleOperation(function: cos,     description: {"cos" + "(" + $0 + ")"},error: nil),
//        "sin": Operation.SingleOperation(function: sin,     description: {"sin" + "(" + $0 + ")"},error: nil),
//        "log": Operation.SingleOperation(function: log,     description: {"log" + "(" + $0 + ")"},error: nil),
//        "tan": Operation.SingleOperation(function: tan,     description: {"tan" + "(" + $0 + ")"},error: nil),
//        "+":   Operation.BinaryOperation(function: {$0+$1}, description: { $0 + "+" +  $1},       error: nil),
//        "−":   Operation.BinaryOperation(function: {$0-$1}, description: {$0 + "−" +  $1},        error: nil),
//        "×":   Operation.BinaryOperation(function: {$0*$1}, description: {$0 + "×" +  $1},        error: nil),
//        "/":   Operation.BinaryOperation(function: {$0/$1}, description: {$0 + "/" +  $1},        error: {$0 != 0}),
//        "^":   Operation.BinaryOperation(function: {$0^^$1},description: {$0 + "^" + $1},         error: nil),
//        "=":   Operation.Equals
//    ]
//
//    //Informs the calculator how to process each data type
//    func compute(symbol: String){
//        if let operation = operations[symbol]{
//            partialEquation.append(symbol as Any)
//            switch operation{
//            case .Constant(let value):
//                total = value
//                equation = symbol
//            case .SingleOperation (let function, let description, let error):
//                total = function(total)
//                equation = description(equation)
//                errorDetection(operation: symbol, bool: error, num1: total, num2: nil)
//            case .BinaryOperation(let function, let description, let error):
//                computeBinOp()
//                binOp = BinaryOperationInfo(function: function, functionDesc: description, firstNum: total,
//                                            firstDesc: equation, symbol: symbol, error: error)
//            case .Equals:
//                computeBinOp()
//            }
//        }
//    }
//
//    //Functions with two variables
//    struct BinaryOperationInfo {
//        var function: (Double, Double) -> Double
//        var functionDesc: (String, String) -> String
//        var firstNum: Double
//        var firstDesc: String
//        var symbol: String
//        var error: ((Double) -> Bool)?
//    }
//
//    var binOp: BinaryOperationInfo?
//
//    func computeBinOp(){
//        if binOp != nil{
//            equation = binOp!.functionDesc(binOp!.firstDesc, equation)
//            total = binOp!.function(binOp!.firstNum, total)
//            errorDetection(operation: binOp!.symbol, bool: binOp!.error, num1: total, num2: total)
//            binOp = nil
//        }
//    }
//
//    func setOperand(varName: String){
//        internalValue = variableValues[varName] ?? 0.0
//        total = internalValue
//        partialEquation.append(varName as Any)
//        equation = varName
//    }
//
//    func setOperand(operand: Double){
//        total = operand
//        partialEquation.append(operand as Any)
//        equation = String(format: "%g", operand)
//    }
//
//    var variableValues: [String: Double] = [:]{
//        didSet{
//            if let lastValue = partialEquation.last as? String{
//                if let lastOperation = operations[lastValue]{
//                    switch lastOperation{
//                    case .Constant:
//                        undoLastOper()
//                    default:
//                        break
//                    }
//                }
//            }
//            program = partialEquation as PropertyList
//        }
//    }
//
//    func clearAll(){
//        clear()
//        variableValues = [:]
//    }
//
//    enum Errors: Error{
//        case sqrtOfNegative, divByZero
//        var description: String{
//            switch self{
//            case .sqrtOfNegative: return "SquareRootOfANegativeNumber"
//            case .divByZero: return "DivideByZero"
//            }
//        }
//    }
//
//    func checkErrors(operation: String, bool: ((Double)-> Bool)?, num1: Double, num2: Double?)throws{
//        if let errorCheck = bool?(num1){
//            guard ((operation != "/") || errorCheck) else{
//                throw Errors.divByZero
//            }
//            guard ((operation != "√") || errorCheck) else{
//                throw Errors.sqrtOfNegative
//            }
//        }
//    }
//
//    func errorDetection(operation: String, bool: ((Double) -> Bool)?=nil, num1: Double, num2: Double?) {
//        do{
//            try checkErrors(operation: operation, bool: bool, num1: num1, num2: num2)
//        }
//        catch Errors.divByZero{
//            internalError = Errors.divByZero.description
//        }
//        catch Errors.sqrtOfNegative{
//            internalError = Errors.sqrtOfNegative.description
//        }
//        catch{
//            internalError = "Unknown"
//        }
//    }
//
//    func undoLastOper(){
//        if !partialEquation.isEmpty{
//            partialEquation.removeLast()
//        }
//    }
//
//    typealias PropertyList = AnyObject
//
//    var program: PropertyList {
//        get {
//            return partialEquation as PropertyList
//        }
//        set {
//            clear()
//            if let arrayOfOps = newValue as? [Any] {
//                for op in arrayOfOps {
//                    if let operand = op as? Double {
//                        setOperand(operand: operand)
//                    } else if operations[op as! String] != nil {
//                        compute(symbol: op as! String)
//                    } else {
//                        setOperand(varName: op as! String)
//                    }
//                }
//            }
//        }
//    }
//
//    func clear(){
//        total = 0.0
//        equation = ""
//        partialEquation.removeAll()
//        binOp = nil
//        internalValue = 0.0
//        internalError = nil
//    }
//}
//
//var brain = Brain()
//
//brain.compute(symbol: "√(9)")
//print(brain.total)
//print(brain.equation)



import Foundation

func random(min: Double, max: Double) -> Double {
    return (Double(arc4random()) / Double(UINT32_MAX)) * (max - min) + min
}

class CalculatorBrain {
    
    private var accumulator = 0.0
    private var accumulatorDescription = " "
    private var internalProgram = [AnyObject]()
    private var internalVariableValue = 0.0
    private var internalError: String?
    private let formatter = NumberFormatter()
    
    var isPartialResult: Bool {
        get {
            return pending != nil
        }
    }
    
    var description: String {
        get {
            if isPartialResult {
                return pending!.binaryFunctionDescription(pending!.firstOperandDescription,
                                                          pending!.firstOperandDescription != accumulatorDescription ? accumulatorDescription : "")
            } else {
                return accumulatorDescription
            }
        }
    }
    
    var errorReported: String {
        get {
            return internalError ?? ""
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    // MARK: - Main brain functions
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double, description:(String) -> String, errorCheck: ((Double) -> Bool)?)
        case BinaryOperation((Double,Double) -> Double, description:((String,String)) -> String, errorCheck: ((Double) -> Bool)?)
        case RandomNumber
        case Equals
    }
    
    private var operations: [String:Operation] = [
        
        "Rand": Operation.RandomNumber,
        "π" : Operation.Constant(.pi),
        "e" : Operation.Constant(M_E),
        "±": Operation.UnaryOperation({-$0}, description: {"±" + "(" + $0 + ")"}, errorCheck: nil),
        "%": Operation.UnaryOperation({$0/100}, description: {"(" + $0 + ")%"}, errorCheck: nil),
        "√": Operation.UnaryOperation(sqrt, description: {"√" + "(" + $0 + ")"},errorCheck: {$0>0}),
        "cos": Operation.UnaryOperation(cos, description: {"cos" + "(" + $0 + ")"},errorCheck: nil),
        "sin": Operation.UnaryOperation(sin, description: {"sin" + "(" + $0 + ")"},errorCheck: nil),
        "log": Operation.UnaryOperation(log, description: {"log" + "(" + $0 + ")"},errorCheck: nil),
        "tan": Operation.UnaryOperation(tan, description: {"tan" + "(" + $0 + ")"},errorCheck: nil),
        "+": Operation.BinaryOperation({$0+$1}, description: { $0 + "+" +  $1},errorCheck: nil),
        "−": Operation.BinaryOperation({$0-$1}, description: {$0 + "−" +  $1},errorCheck: nil),
        "×": Operation.BinaryOperation({$0*$1}, description: {$0 + "×" +  $1},errorCheck: nil),
        "/": Operation.BinaryOperation({$0/$1}, description: {$0 + "/" +  $1},errorCheck: {(($0 > 0) || ($0 < 0))}),
        "=": Operation.Equals
    ]
    
    private var provisoryConstantDescription:String?
    private var performOperationDescription:String?
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            internalError = nil
            internalProgram.append(symbol as AnyObject)
            switch operation {
            case .Constant(let value):
                accumulator = value
                accumulatorDescription = symbol
            case .UnaryOperation(let function, let descriptionFunction, let errorFunction):
                accumulatorDescription =  descriptionFunction(accumulatorDescription)
                accumulator = function(accumulator)
                launchErrorDetection(operation: symbol, guardBoolean: errorFunction, firstOperand: accumulator, secondOperand: nil)
            case .BinaryOperation(let function, let descriptionFunction, let errorFunction):
                executePendingBinaryOperation()
                //accumulatorDescription = accumulatorDescription
                pending = PendingBinaryOperationInfo(binaryFunction: function, binaryFunctionDescription: descriptionFunction, firstOperand: accumulator, firstOperandDescription: accumulatorDescription, binaryFunctionSymbol: symbol, errorBooleanFunction: errorFunction)
            case .Equals:
                executePendingBinaryOperation()
            case .RandomNumber:
                accumulator = random(min: 0.0, max: 1.0)
                accumulatorDescription = String(format:"%g",accumulator)
            }
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double) -> Double
        var binaryFunctionDescription: (String,String) -> String
        var firstOperand: Double
        var firstOperandDescription: String
        var binaryFunctionSymbol: String
        var errorBooleanFunction: ((Double) -> Bool)?
    }
    
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulatorDescription = pending!.binaryFunctionDescription(pending!.firstOperandDescription, accumulatorDescription)
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            launchErrorDetection(operation: pending!.binaryFunctionSymbol, guardBoolean: pending!.errorBooleanFunction, firstOperand: accumulator, secondOperand: accumulator)
            pending = nil
        }
    }
    
    func setOperand(VariableName: String) {
        internalVariableValue = variableValues[VariableName] ?? 0.0
        accumulator = internalVariableValue
        internalProgram.append(VariableName as AnyObject)
        accumulatorDescription = VariableName
    }
    
    func setOperand(operand: Double) {
        accumulator = operand
        internalProgram.append(operand as AnyObject)
        accumulatorDescription = String(format:"%g",operand)
    }
    
    var variableValues: [String:Double] = [:] {
        didSet {
            if let lastinternalProgramValue = internalProgram.last as? String {
                if let lastThingDoneByTheBrain = operations[lastinternalProgramValue]  {
                    switch lastThingDoneByTheBrain {
                    case .Constant:
                        undoLastThingDoneInTheBrain()
                    default:
                        break
                    }
                }
            }
            program = internalProgram as PropertyList
        }
    }
    
    func clearAllTheBrain() {
        clear()
        variableValues = [:]
    }
    
    // MARK: - Error detection
    private enum CalculatorBrainError: Error {
        case SquareRootOfaNegativeNumber
        case DivideByZero
        
        var description: String {
            switch self {
            case .SquareRootOfaNegativeNumber: return "SquareRootOfaNegativeNumber"
            case .DivideByZero: return "DivideByZero"
            }
        }
    }
    
    private func detectErrors(unaryBinaryOperation: String, guardBoolean: ((Double) -> Bool)?, firstOperand: Double, secondOperand: Double?) throws {
        
        if let operationErrorCheckBoolean = guardBoolean?(firstOperand) {
            guard ((unaryBinaryOperation != "÷") || operationErrorCheckBoolean) else {
                throw CalculatorBrainError.DivideByZero
            }
            guard ((unaryBinaryOperation != "√") || operationErrorCheckBoolean) else {
                throw CalculatorBrainError.SquareRootOfaNegativeNumber
            }
        }
    }
    
    private func launchErrorDetection(operation: String, guardBoolean: ((Double) -> Bool)?=nil, firstOperand: Double, secondOperand: Double?) {
        do {
            try detectErrors(unaryBinaryOperation: operation, guardBoolean: guardBoolean, firstOperand: firstOperand, secondOperand: secondOperand)}
        catch CalculatorBrainError.DivideByZero { internalError = CalculatorBrainError.DivideByZero.description}
        catch CalculatorBrainError.SquareRootOfaNegativeNumber { internalError = CalculatorBrainError.SquareRootOfaNegativeNumber.description }
        catch {internalError = "Unknown"}
    }
    
    private func undoLastThingDoneInTheBrain() {
        internalProgram.removeLast()
    }
    
    // MARK: -  Operation program - save all user operation history
    typealias PropertyList = AnyObject
    
    var program: PropertyList {
        get {
            return internalProgram as PropertyList
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand: operand)
                    } else if operations[op as! String] != nil {
                        performOperation(symbol: op as! String)
                    } else {
                        setOperand(VariableName: op as! String)
                    }
                }
            }
        }
    }
    
    private func clear() {
        accumulator = 0.0
        accumulatorDescription = " "
        internalVariableValue = 0.0
        pending = nil
        internalProgram.removeAll()
        internalError = nil
    }
}

var brain = CalculatorBrain()
brain.performOperation(symbol: "/")
print(brain.result)


print(sqrt(8))
