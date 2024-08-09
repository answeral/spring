# 🐾 Happy Paw Pet
[ 의료 메디컬 AI 분석 서비스 개발자 과정 ] 팀 프로젝트 🐾 Happy Paw Pet 🐾 레포 (2024.07 ~ 2024.08 🛠)

</br>


## 😊 역할분담 & 팀원 소개

|담당자|담당 내용|
|:---|:---|
|김윤지|Git & 프로젝트 세팅, ERD 설계, 이미지 유사도 측정 구현, 전체 API 구현, 배포|
</br>

## 🔑 Key Feature
<img width="1728" alt="image" src="https://github.com/user-attachments/assets/3e19818b-1a18-4508-8c34-5c6d42b1b0fc">

</br>
</br>

## 🛠 기술 스택
<img src="https://img.shields.io/badge/Java-1A6C80?style=flat-square&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white">
<img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white"> <img src="https://img.shields.io/badge/Flask-000000?style=flat-square&logo=flask&logoColor=white"> <img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white"> <img src="https://img.shields.io/badge/Selenium-43B02A?style=flat-square&logo=selenium&logoColor=white">
<br/>
<img src="https://img.shields.io/badge/MYSQL-4479A1?style=flat-square&logo=MYSQL&logoColor=white">
<img src="https://img.shields.io/badge/Amazon EC2-FF9900?style=flat-square&logo=Amazon EC2&logoColor=white">
<img src="https://img.shields.io/badge/Amazon RDS-527FFF?style=flat-square&logo=Amazon RDS&logoColor=white">

</br>

</div>

# 📁 Folder 구조

```jsx
📁 src. 📁 main. 📁 java
|                   |_ 📁 com. 📁 java
|                   |                |_ 📁 config
|                   |                |_ 📁 controller
|                   |                |_ 📁 dao
|                   |                |_ 📁 dto
|                   |                |_ 📁 service
|                   |                |_ 📁 utils
|                   |                |_ HappyPawPetApplication.java
|                   |                  
|                   |_ 📁 resources
|                   |_ 📁 webapp
|
📁 test
```


</br>


## 😉 API 명세서

[최종명세서]()

</br>

## 💽 Database ERD
<img width="602" alt="스크린샷 2024-02-02 오후 5 34 54" src="https://github.com/Team-Picle/Picle-Server/assets/101168694/7ebce724-8485-4a62-a5a5-cbf54ea9a623">


</br>
</br>


## 🧵 Git Convention

### 🔹 Commit Message Convention
`ex) git commit -m "[FEAT] 카카오 로그인 구현`

```plain
- ✨ [FEAT]      새로운 기능 구현
- 🐛 [FIX]       버그, 오류 해결
- 🧹 [CHORE]     src 또는 test 파일을 수정하지 않는 기타 변경 사항 ( 새로운 파일 생성, 파일 이동, 이름 변경, 빌드/패키지 매니저 설정 변경 등 )
- 🔥 [REMOVE]    폴더 또는 파일 삭제
- ♻️ [REFACTOR]   기능 추가나 버그 수정이 없는 코드 변경 ( 코드 구조 변경 등의 리팩토링 )
- 🎨 [STYLE]     코드의 의미에 영향을 미치지 않는 변경 사항 ( 코드 형식, 변수명 변경, 오타 수정, 세미콜론 추가: 비즈니스 로직에 변경 없음 )
- 🧪 [TEST]      테스트 추가 또는 이전 테스트 수정
- 📝 [DOCS]      README나 WIKI 등의 문서 수정
- 📦 [CI]        CI 구성 파일 및 스크립트 변경
- 🎉 [INIT]      Initial commit을 하는 경우
- 🤝🏻 [MERGE]     Merge 하는 경우
```

</br>

### 🔹 Branch Strategy
### Git Flow

기본적으로 Git Flow 전략을 이용한다. Fork한 후 나의 repository에서 작업하고 구현 후 원본 repository에 pr을 날린다. 작업 시작 시 선행되어야 할 작업은 다음과 같다.

```java
1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
6. merge된 작업이 있을 경우, 다른 브랜치에서 작업을 진행 중이던 개발자는 본인의 브랜치로 merge된 작업을 Pull 받아온다.
7. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
```

- 기본적으로 git flow 전략을 사용합니다.
- main, develop, feature 3가지 branch 를 기본으로 합니다.
- main → develop → feature. feature 브랜치는 feat/기능명으로 사용합니다.
- 이슈를 사용하는 경우 브랜치명을 feature/[issue num]로 합니다.

<br>

