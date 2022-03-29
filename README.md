## Project - 학식 도우미

인천대학교 캡스톤 프로젝트 팀 various  
  
크라우드 카운팅 부분 https://github.com/inqs/crowdcounting_capstone

### 1) 개요

본 프로젝트는 인천대학교 컴퓨터 공학부에서 진행되는 졸업 작품에 관한 내용으로
2021 년 2학기부터 2022년 1학기까지 진행되는 프로젝트입니다.
최근 대면수업을하면서 학식 사용 인구가 폭발적으로 늘어나 이용에 차질을 겪는 사람이 많기때문에
효율적으로 학식을 이용할 수 있게 사람들에게 이용 현황을 시각화 하는것을 목표로 진행 됩니다.

### 2) 프로젝트 목표

최근 학생식당을 사용하는 인구가 매우 증가하여 식당에서 식사를 하는 시간보다 줄을 서서 대기하는 시간이 더 긴 경우가 많습니다.
수업이 늦게 있어서 시간이 여유있는 학생이 있는 반면에 점심시간 직후에 수업이 잡혀있는 학생은 줄을 설때 시간이 애매한 경우가 많습니다.
이 프로젝트는 학생식당의 총 사용인원을 실시간으로 시각화하여 당장 사용할 수 있는지에 대해서 이용자가 직접 판단하도록 유도합니다.
또한, 학식 서비스 제공자인 영양사에게 요일별, 시간별 사용 인원에 대한 데이터를 제공하여 메뉴와 이벤트 등을 설정하여
더 나은 서비스를 제공할 수 있도록 도와주는 것이 프로젝트의 목표입니다.

### 3) 사용 툴
- Python
- flutter(Dart)
- Firebase
- OpenCV
- Raspberry Pi

### 4) Input 준비
* 라즈베리파이를 이용하여 설정한 시간 간격마다 이미지를 촬영하여 실시간으로 Firebase Storage에 업로드  
![pi_setup](https://user-images.githubusercontent.com/94462842/160591361-198dc285-7164-48d2-a8bf-3fe84e0ac007.PNG)  
  
### 5) Output  
* Firebase Storage에서 불러온 이미지  
  <img src="https://user-images.githubusercontent.com/94462842/160598324-906ab847-34fe-4fc4-8ce0-6933f6564c1a.PNG" width="500" height="500">  
  
* pre-trained 데이터셋을 바탕으로 cnn 처리된 이미지    
![res_img](https://user-images.githubusercontent.com/94462842/160594072-227b05cb-0aee-44b8-85c2-b47950c6de3c.PNG)  
  
* 콘솔 output    
![result](https://user-images.githubusercontent.com/94462842/160594112-43411239-a13d-48ac-8152-475f56a89686.PNG)  

* Firestore DB로 결과값 저장    
![firestore](https://user-images.githubusercontent.com/94462842/160594172-329148fd-e338-4b7d-9008-b01afbeee4ca.PNG)  
  

### 6) 출처  
상하이공과대학 Crowd Counting caffe model dataset 사용  
```
@inproceedings{zhang2016single,
  title={Single-image crowd counting via multi-column convolutional neural network},
  author={Zhang, Yingying and Zhou, Desen and Chen, Siqin and Gao, Shenghua and Ma, Yi},
  booktitle={Proceedings of the IEEE conference on computer vision and pattern recognition},
  pages={589--597},
  year={2016}
}
```
