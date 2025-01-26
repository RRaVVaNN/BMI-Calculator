
import UIKit

var calculatorBrain=CalculatorBrain()
class CalculateViewController: UIViewController {
    
    @IBOutlet weak var SliderA: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text=String(format: "%.2fm", sender.value)
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text=String(format: "%.0fKg", sender.value)
        
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        let height=heightSlider.value
        let weight=weightSlider.value
        calculatorBrain.calculateBMI(weight, height)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC=segue.destination as! ResultViewController
            destinationVC.bmiValue=calculatorBrain.getBMIValue()
            destinationVC.color=calculatorBrain.getColor()
            destinationVC.advice=calculatorBrain.getAdvice()
        }
    }
}
