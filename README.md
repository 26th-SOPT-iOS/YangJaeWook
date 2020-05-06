# Yang Jaeuk
양재욱

안녕하세요

iOS파트 YB입니다.

# 과제 업로드 레포

## 목차

+ 1차 과제 : 1-1) 네비게이션을 이용한 화면 이동 | 1-2) vc간 이동 및 데이터 전달
+ 2차 과제 : 2-1) 계산기 | 2-2) Zeplin을 활용해 AutoLayout 잡기
+ 3차 과제 :
+ 4차 과제 :
+ 5차 과제 :
+ 6차 과제 :
+ 7차 과제 :
<hr/>

### 1차 과제 01

#### navigation 이용 화면이동

기한: ~2020.04.24(금)

<img width="1792" alt="first_assignment01" src="https://user-images.githubusercontent.com/56633607/79964541-d2e70280-84c5-11ea-82fc-86fa8fc2f319.png">

review

- navigation을 이용하면 차곡차곡 vc를 쌓아가는 과정을 통해 아이폰 설정화면 처럼 한 화면씩 뒤로가기 할 수 있다.

<hr/>

### 1차 과제 02   

#### 로그인 화면 구현

기한: ~2020.04.24(금)

<img width="1756" alt="first_Assignment02" src="https://user-images.githubusercontent.com/56633607/79964607-ebefb380-84c5-11ea-9d50-b4ba85f8be3b.png">

<hr/>

<div>
 <img src="./READMEimg/fw_hw02-1.png" width="250" height="450">
 <img src="./READMEimg/fw_hw02-3.png" width="250" height="450">
 <img src="./READMEimg/fw_hw02-2.png" width="250" height="450">
</div>

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

review

- navigation을 이용해 하나의 vc 간 present는 가능하지만 leafvc 부터 rootvc 까지 dismiss 하는 방법을 모르겠다.
- UIButton을 vc 하단에 배치했으나 present modally를 하면 버튼이 사라지거나 상단으로 이상하게 배치되는 문제가 있다.
- imageView를 모든 View에서 일정한 위치에 놓고싶다.



<hr/>

### 2차 과제 01

#### 계산기

기한 ~05.08, 2020

<img width="1756" alt="스크린샷 2020-05-06 오후 11 42 49" src="https://user-images.githubusercontent.com/56633607/81191529-15472e00-8ff4-11ea-952a-f4b6ea14148c.png">

### 2차 과제 02

####  Zeplin + AutoLayout

기한 ~05.08, 2020

<img width="1756" alt="스크린샷 2020-05-06 오후 11 44 06" src="https://user-images.githubusercontent.com/56633607/81191667-3f98eb80-8ff4-11ea-9df9-2f66e1f5ce98.png">