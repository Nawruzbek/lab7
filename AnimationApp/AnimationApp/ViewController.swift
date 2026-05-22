import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        startAnimation()
    }
    
    func startAnimation() {
        // Создаём квадрат
        let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        square.center = view.center
        square.backgroundColor = .red
        square.layer.cornerRadius = 10
        view.addSubview(square)
        
        // Анимация 1: увеличение и смена цвета
        UIView.animate(withDuration: 0.5, animations: {
            square.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            square.backgroundColor = .blue
        }) { _ in
            // Анимация 2: возврат к исходному размеру и цвету
            UIView.animate(withDuration: 0.5) {
                square.transform = .identity
                square.backgroundColor = .red
            }
        }
    }
}
