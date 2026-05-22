import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var drawingView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView.backgroundColor = .white
        drawShapes()
    }
    
    func drawShapes() {
        let renderer = UIGraphicsImageRenderer(size: drawingView.bounds.size)
        let image = renderer.image { ctx in
            let cgContext = ctx.cgContext
            
            // 1. Красный прямоугольник
            cgContext.setFillColor(UIColor.red.cgColor)
            cgContext.fill(CGRect(x: 20, y: 20, width: 100, height: 80))
            
            // 2. Синий круг
            cgContext.setFillColor(UIColor.blue.cgColor)
            cgContext.fillEllipse(in: CGRect(x: 150, y: 20, width: 80, height: 80))
            
            // 3. Зелёная линия
            cgContext.setStrokeColor(UIColor.green.cgColor)
            cgContext.setLineWidth(5.0)
            cgContext.move(to: CGPoint(x: 20, y: 150))
            cgContext.addLine(to: CGPoint(x: 250, y: 150))
            cgContext.strokePath()
            
            // 4. Оранжевый прямоугольник
            cgContext.setFillColor(UIColor.orange.cgColor)
            cgContext.fill(CGRect(x: 20, y: 180, width: 100, height: 80))
            
            // 5. Фиолетовый круг
            cgContext.setFillColor(UIColor.purple.cgColor)
            cgContext.fillEllipse(in: CGRect(x: 150, y: 180, width: 80, height: 80))
        }
        drawingView.image = image
    }
}
