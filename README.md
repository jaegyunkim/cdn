# cdn

GitHub Pages를 간단한 CDN으로 사용하는 저장소 (이미지, CSS, JS, JSON, 소형 영상용).

## 구조

```
cdn/
├── videos/          # mp4, webm
├── images/          # jpg, png, webp
├── scripts/gen-manifest.sh
├── manifest.json    # 파일 목록 (스크립트로 생성)
└── index.html       # 업로드된 파일 미리보기
```

## 업로드

```bash
cp ~/fishing01.mp4 videos/
./scripts/gen-manifest.sh
git add . && git commit -m "upload video" && git push origin main
```

push 하면 `.github/workflows/pages.yml`이 자동 배포합니다.
(최초 1회: GitHub 저장소 Settings → Pages → Source를 **GitHub Actions**로 설정)

## 사용

```
https://<username>.github.io/cdn/videos/fishing01.mp4
```

```html
<video controls>
  <source src="https://<username>.github.io/cdn/videos/fishing01.mp4">
</video>
```

## 제한 및 주의

- 저장소 권장 1GB 이하, 파일 100MB 초과 불가, 트래픽 월 약 100GB 소프트 제한
- 대용량/다수 영상(100개 이상, 수백 MB~GB)은 **Cloudflare R2 + 커스텀 도메인(cdn.내도메인.com)** 권장
  (Pages는 웹사이트, R2는 영상 저장, Cloudflare CDN은 전송)
