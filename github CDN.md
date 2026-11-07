GitHub Pages를 CDN처럼 사용하는 것은 **이미지, CSS, JavaScript, JSON, 소형 다운로드 파일**에는 괜찮지만, **대용량 영상 CDN으로는 추천하지 않습니다.**

## **결론**

영상 파일을 Git Clone 후 업로드하여 GitHub Pages로 배포하려면:

✅ 가능

* mp4, webm 파일 호스팅 가능  
* HTTPS 자동 지원  
* 무료  
* 전세계 GitHub CDN 사용

❌ 문제점

* 저장소 크기 제한  
* 영상 용량 증가 시 git 관리 지옥  
* 트래픽 과다 발생 시 제한 가능  
* 스트리밍 최적화 안됨

---

## **GitHub Pages 구조 예시**

my-cdn/  
├── videos/  
│   ├── fishing01.mp4  
│   ├── fishing02.mp4  
│   └── camping01.mp4  
├── images/  
│   └── thumb01.jpg  
└── index.html

업로드

git add .  
git commit \-m "upload video"  
git push origin main

접속

https\://username.github.io/my-cdn/videos/fishing01.mp4

영상 태그

\<video controls\>  
  \<source src="https\://username.github.io/my-cdn/videos/fishing01.mp4"\>  
\</video\>

---

## **GitHub 공식 권장사항**

권장:

* HTML  
* CSS  
* JS  
* 문서  
* 이미지

비권장:

* 대용량 바이너리  
* 미디어 아카이브  
* 영상 저장소

특히

수백 MB \~ 수 GB 영상

을 지속적으로 업로드하면 git 자체가 매우 무거워집니다.

---

# **더 좋은 대안 ① Cloudflare R2**

현재 가장 추천

비용

저장 : 매우 저렴  
트래픽 : 무료

구성

GitHub  
  ↓  
Cloudflare R2  
  ↓  
Cloudflare CDN  
  ↓  
사용자

URL

cdn.mydomain.com/video.mp4

장점

* S3 호환  
* CDN 자동  
* 대용량 영상 적합  
* 다운로드 속도 좋음

인스타그램, 쇼츠 콘텐츠용 원본 저장에 적합

---

# **더 좋은 대안 ② Bunny CDN**

영상 서비스 운영자들이 많이 사용

비용

Storage 1TB  
월 1\~2달러 수준

트래픽  
GB당 과금

장점

* Video CDN 특화  
* HLS 지원  
* 썸네일 생성 가능

---

# **더 좋은 대안 ③ Cloudflare Pages \+ R2**

정적 페이지

GitHub  
      ↓  
Cloudflare Pages

영상

R2 Storage

구성

portfolio.com  
cdn.portfolio.com

형태로 분리 가능

현재 개인 콘텐츠 제작자들이 가장 많이 쓰는 조합 중 하나입니다.

---

## **낚시/캠핑 콘텐츠 운영이라면 추천**

사용 목적이:

* 인스타 릴스  
* 쇼츠 원본 보관  
* 썸네일 저장  
* AI 생성 영상 저장  
* 개인 CDN

이라면

GitHub Pages → 웹사이트  
Cloudflare R2 → 영상 저장  
Cloudflare CDN → 전송

조합이 GitHub Pages 단독보다 훨씬 안정적입니다.

100개 이상의 MP4를 올릴 계획이라면 GitHub Pages 대신 **Cloudflare R2 \+ 사용자 도메인(cdn.내도메인.com)** 으로 시작하는 것을 권장합니다. Git으로 영상을 관리하는 것보다 업로드와 운영이 훨씬 편합니다.

