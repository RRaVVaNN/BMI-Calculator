
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    mutating func calculateBMI(_ weight: Float,_ height: Float){
        let bmiValue = weight/(height*height)
        if bmiValue<18.5{
            bmi=BMI(value: bmiValue, advice: "Eat more", color: UIColor.blue)
        }
        else if bmiValue<24.9{
            bmi=BMI(value: bmiValue, advice: "Eat normally", color: UIColor.green)
        }
        else{
            bmi=BMI(value: bmiValue, advice: "Eat less", color: UIColor.red)
        }
    }
    mutating func getBMIValue()->String{
        let bmiStr=String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiStr
    }
    mutating func getColor()->UIColor{
        return bmi?.color ?? UIColor.white
    }
    mutating func getAdvice()->String{
        return bmi?.advice ?? "nothing"
    }
}

