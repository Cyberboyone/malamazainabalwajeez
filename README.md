# Malama Zainab Jaafar Alwajeez

Offline audio lessons app for **Malama Zainab Jaafar Mahmud** — Karatun Littafin Alwajiz (8 parts).

Flutter app with neumorphic UI, offline Opus audio (6 kbps mono 16 kHz), background playback,
resume-progress tracking, and AdMob banner ads.

- Package: `com.nakudin.malamazainabalwajeez`
- AdMob App ID: `ca-app-pub-9529770421530115~6978861918`
- AdMob Banner: `ca-app-pub-9529770421530115/9324310886`
- Version: `1.0.0+1`

## Build

GitHub Actions (`.github/workflows/build.yml`) builds on every push to `main`:

- Debug APK
- Release APK (signed)
- Release AAB for Play Store (signed)

To create a GitHub release with the AAB/APK attached, run the workflow manually
(`workflow_dispatch`) with a `release_tag` input.

## Release signing (Play Store)

The release keystore is **not** in the repository. It is stored locally at:

```
release-keystore/release.jks
```

with credentials in `release-keystore/credentials.txt` (BACK THESE UP — losing the
keystore means you can never update the app on Play Store again).

The same credentials are stored as GitHub Actions secrets:

| Secret             | Purpose                          |
| ------------------ | -------------------------------- |
| `KEYSTORE_BASE64`  | base64 of `release.jks`          |
| `KEYSTORE_PASSWORD`| keystore password                |
| `KEY_ALIAS`        | key alias (`malama`)             |
| `KEY_PASSWORD`     | key password                     |

The workflow decodes these into `android/app/release.jks` + `android/key.properties`
at build time. `key.properties`, `*.jks` and `*.keystore` are gitignored.

## Local build

```sh
flutter pub get
dart run flutter_launcher_icons   # regenerate launcher icons from assets/images
flutter test
flutter build apk --release      # or: flutter build appbundle --release
```

## Audio

Source MP3s were converted to Opus for tiny download size:

```sh
ffmpeg -i in.mp3 -c:a libopus -b:a 6k -ar 16000 -ac 1 -application voip out.ogg
```
