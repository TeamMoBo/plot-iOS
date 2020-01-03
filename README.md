#  🎬 영화관에서의 첫 맛남 , 영화 데이트 매칭 서비스 , Plot 🍿

>Plot [줄거리]
>당신의 만남이 가장 쉽고 빠르게 이루어질 수 있도록, Plot은 당신을 위한 줄거리를 준비합니다. 


#### 언제까지 답장없는 소개팅 앱에 매달릴거야?  
#### 준비는 우리가 다 할게. 너는 따라오기만 해 ! 
#### 10분 만에 대화부터 예매까지 전부 끝나는 영화 데이트 매칭. 


<img width="250" alt="스크린샷 2019-10-22 오후 2 37 38" src="https://user-images.githubusercontent.com/46750574/71548829-55b7ef00-29f7-11ea-9048-343674ae2774.png">


![SwiftBadge](https://img.shields.io/badge/Swift-5.1-orange) ![XcodeBadge](https://img.shields.io/badge/Xcode-11.3-blue) ![iOS](https://img.shields.io/badge/iOS-13.3-lightgrey)

> 개발 기간: **2019.12.21 ~ 2020.01.03**
> iOS : [chokyungjin](https://github.com/chokyungjin) ,  [ujcheon](https://github.com/ujcheon)



---

### 👏 Application Service Work flow 

<img width="619" alt="워크플로우" src="https://user-images.githubusercontent.com/55737889/71726940-fc7b1000-2e7b-11ea-9067-853ff61b986d.png">

---

### 👏 Development Environment and Using Library

* Alamofire 4.7 [Connection Library]
* FloatRatingView 4 [Rating Library]
* Pageboy 3.2 [Top Tabbar]
* Lottie [JSON Animation IMG]
* Tabman 2.6 [Top Tabbar]
* Firebase/Database [FirebaseDatase]
* Firebase/Auth [FirebaseCRUD]
* Firebase/Storage [FirebaseDB]
* Firebase/Analytics [FirebaseDB]
* Firebase/RemoteConfig [FirebaseDB]
* SnapKit 5.0.0 [AutoLayout]
* TextFieldEffects [TextField]
* ObjectMapper 3.4 [JSON Package]

---

### 👏 Function Introduction

| Function                    | Implemention | Etc , Part  | Priority |
| --------------------------- | ------------ | ------------ | ------------ |
| SignIn / SignUp             | △            | Implementing [ujcheon](https://github.com/ujcheon) |1|
| Rating                      | ⭕️            | Completed , [chokyungjin](https://github.com/chokyungjin) |2|
| Tabbar On Top               | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| GradientLayer               | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |2|
| MultiInteraction            | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| Firebase_Chatting           | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| Custom PopUp                | ⭕️            | Completed , [ujcheon](https://github.com/ujcheon) |1|
| Custom PickerView           | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| RadioButton , Photo Iibrary | ⭕️            | Completed , [ujcheon](https://github.com/ujcheon) |1|
| CustomNavigationBar         | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| Thread Sleep                | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| IBCollection                | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| KeyboardConstraint          | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| SplashLaunScreen            | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |1|
| HashTag                     | ⭕️          | Canceled , [ujcheon](https://github.com/ujcheon) |3|
| MyPageView                  | ⭕️            | Completed , [ujcheon](https://github.com/ujcheon) |2|
| urlLinkOpen              | ⭕️            | Completed, [chokyungjin](https://github.com/chokyungjin) |2|
|  MatchingSuggestionView              | ⭕️            | Completed, [ujcheon](https://github.com/ujcheon) |2|
| ChattingWaitingView              | ⭕️            | Completed, [ujcheon](https://github.com/ujcheon) |2|
| PaySystem In App | ❌           | Canceled |3|
| CustomStepper | ❌          | Canceled |3|


### 👏 Screenshots

초기 로그인, 회원가입
<br></br>
<img width="200" src="https://user-images.githubusercontent.com/46750574/71696598-c47eb900-2df8-11ea-9bac-45882c59e372.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696602-c5174f80-2df8-11ea-9572-499362f00c48.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696606-c5afe600-2df8-11ea-9916-2d80a52e0945.png">
<img width="348" alt="스크린샷 2020-01-03 오후 11 32 05" src="https://user-images.githubusercontent.com/55737889/71728786-65b15200-2e81-11ea-9dec-d5a7997ac522.png">
<br></br>

초기 홈 화면은 텅빈 더미 데이터로 구성 , 현재 상영작 혹은 개봉 예정작으로 영화 선택과 시간 선택 결정
<br></br>
<img width="200" src="https://user-images.githubusercontent.com/46750574/71696599-c47eb900-2df8-11ea-8e47-db56112f28d9.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696603-c5174f80-2df8-11ea-8db1-7f91d70e22db.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696589-c0529b80-2df8-11ea-976d-ab368a79ba07.png">
<br></br>

매칭 알고리즘을 통한 채팅 파트너 결정
<br></br>
<img width="200" src="https://user-images.githubusercontent.com/46750574/71696596-c3e62280-2df8-11ea-8aa8-0a0f92e610f8.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696601-c5174f80-2df8-11ea-9653-2eea8ebf2738.png">
<br></br>

매칭 선택 팝업 , 채팅 뷰
<br></br>
<img width="200" src= "https://user-images.githubusercontent.com/46750574/71720396-ed3c9800-2e64-11ea-9dc4-bdde7247c6ca.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71720395-ed3c9800-2e64-11ea-93a2-b596a692c8a0.png">
<br></br>

매칭 성공 , 실패 팝업
<br></br>
<img width="200" src="https://user-images.githubusercontent.com/46750574/71696600-c47eb900-2df8-11ea-9133-e844ccdc32a0.png"><img width="200" src="https://user-images.githubusercontent.com/46750574/71696605-c5afe600-2df8-11ea-95ce-246d6508ebb0.png">
<br></br>

시간 수정 페이지(Implementing)
<br></br>
<img width="200"  src="https://user-images.githubusercontent.com/46750574/71572200-56e53b00-2b21-11ea-9eaf-c4beb9077152.png">
<br></br>

---

### 🎯  Issue and Bug Report

* Issue 1 
  
  * Git 을 통한 협업 경험의 부재로 인한 Branch 경험 부족
  * Master 에서의 Commit 을 피하고 Develop 브랜치를 하나 더 생성하여 충돌 Handling
  
  <img width="350" alt="스크린샷 2020-01-03 오후 7 28 17" src="https://user-images.githubusercontent.com/46750574/71718673-55887b00-2e5f-11ea-8455-fee807e9b1b6.png"><img width="350" alt="스크린샷 2020-01-03 오후 7 53 25" src="https://user-images.githubusercontent.com/46750574/71719779-bcf3fa00-2e62-11ea-844b-dd35b8dea678.png">

  
  
* Issue 2

  * 이미지를 캐쉬로 받지않고 사용한 점 , 이미지 리소스를 통신할 때 Cache를 사용하지 않음.

  ```swift
  OperationQueue().addOperation {
                  let thumnailImage = self.getThumnailImage(withURL: movie.thumnailImageURL)
                  DispatchQueue.main.async {
                      cell.imageThumbnail.contentMode = .scaleAspectFill
                      cell.imageThumbnail.image = thumnailImage
                      
                  }
              }
  ```

  

* Issue 3

  * 유연한 AutoLayout Setting 부족. 
  * Scroll view 의 오토레이아웃을 잡는데 view의 height 를 고정해야 하는데 scroll view의 height 를 고정해서 시간이 오래 걸렸었다. view의 height를 고정하고 들어가는 image 에 오토레이아웃을 주니 해결.

* Issue 4

  * 서버 통신 경험 부족으로 인한 잘못된 데이터 저장 , 이미지 URL 같은 경우에는 KingFisher 라는 라이브러리를 쓰기로 함.

  ```swift
  func getMovieList(completion: @escaping (ListResponse?) -> Void) {
          guard let finalURL = URL(string: appUrl) else {
              return
          }
          let session = URLSession(configuration: .default)
          var request = URLRequest(url: finalURL)
          request.addValue("application/x-www-form-urlencoded" , forHTTPHeaderField: "Content-Type")
          request.httpMethod = "GET"
          let task = session.dataTask(with: request) { (data, response, error) in
              if let error = error {
                  print(error.localizedDescription)
                  return
              }
              guard let resultData = data else {
                  return
              }
              do {
                  let movieLists: ListResponse  = try JSONDecoder().decode(ListResponse.self, from: resultData)
                  self.dataManager.setMovieList(list: movieLists.results.randMovie)
                  self.dataManager.setReserveMovieList(list: movieLists.results.reserveMovie)
                  self.dataManager.setReserveDateList(list: movieLists.results.reserveDate)
                  self.dataManager.setDidOrderTypeChangedAndDownloaded(true)
                  self.reloadMovieLists()
                  completion(movieLists)
              }
              catch let error {
                  print(error.localizedDescription)
              }
          }
          task.resume()
      }
  ```

  

* Issue 5

  *  UIPickerView 2개를 한 뷰에서 쓰는데 하나의 Picker view에서 입력값이(titles.count) 다른 picker view에 옮겨졌던 문제점이 있었고 func pickerView 를 두개로 나눴던 걸 한개로 합치고 delegate를 2개를 만들어서 써서 해결.

```swift
extension SignUpSecondVC: ToolbarPickerViewDelegate, ToolbarPickerViewDelegate2 {
    
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.minAgeField.text = self.titles[row]
        self.minAgeField.resignFirstResponder()
    }
    
    func didTapDone2() {
        let row = self.pickerView2.selectedRow(inComponent: 0)
        self.pickerView2.selectRow(row, inComponent: 0, animated: false)
        self.maxAgeField.text = self.titles[row]
        self.maxAgeField.resignFirstResponder()
    }
  
...
  
extension SignUpSecondVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.titles.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.titles[row]
        
    }
```

---
### 👏 Contributor

* 조경진 
* 천유정

---
### 👏 Other Part

👨‍💻 Planner

* 신가인
* 김수빈

👩‍💻 Designer

* 안형민
* 정현강
* 조수민

👨‍💻 Server 

* 이상윤
* 양희연
* 이다현
* 이재용

👩‍💻 Android 

* 황지혜
* 김민진
* 강수빈
* 박길현

👨‍💻 iOS 💻

* 조경진 
* 천유정

---

### 👏 Report 

Please [**file**](https://github.com/TeamMoBo/MoboiOS/issues/new) issues to send feedback or report a bug. Thank you ! ![btnSend@3x](https://user-images.githubusercontent.com/46750574/71605885-dd485e00-2baf-11ea-8301-0066a608c26e.png)

---

### 👏 References

[How to Use Chatting in iOS](https://www.youtube.com/channel/UCScI4bsr-RaGdYSC2QAHWug)

[ColectionView in TableView](https://www.youtube.com/watch?v=6ZxA2pmV3VM)
[How to Use Lottie](https://www.youtube.com/watch?v=dM6u5FlZB70&t=313s)
