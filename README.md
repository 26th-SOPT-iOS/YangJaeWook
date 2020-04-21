# YangJaeUk
양재욱

안녕하세요

iOS파트 YB입니다.

# 과제 업로드 레포

## 목차

<pre>
<code>
+ 1차 세미나) vc간 이동 및 데이터 전달
+ 2차 세미나)
+ 3차 세미나)
+ 4차 세미나)
+ 5차 세미나)
+ 6차 세미나)
+ 7차 세미나)
</code>
</pre>

### 1차 과제   
기한: ~2020.04.24(금)

![Alt text](/Users/yangjaeug/Desktop/firstAssignment.png)

<pre>
<code>
class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지뷰에 이미지 넣기
        imageView.image = UIImage(named: "sopt.png")
    }

    @IBAction func transferData(_ sender: Any) {
        
        // 데이터 전달하기
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LogInViewController else {return}
        
        receiveViewController.id = idTextField.text
        receiveViewController.pw = pwTextField.text
        // vc present
        self.present(receiveViewController, animated: true, completion: nil)
    }

}
</code>
</pre>


