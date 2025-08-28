# Aurora Player 🎶🎥

Aurora Player is a customizable music & video player with themes, visualizers, ads support, and batch editing tools.

---

## Features ✅
- 🎵 Play audio files with Just Audio
- 📺 Play video files with Video Player
- 🌙 Dark & Light themes
- 🎨 Support for nostalgic themes (future expansion)
- 📊 Audio visualizer (basic bars)
- 📂 Batch rename songs with custom patterns
- 📢 Banner Ads (AdMob test IDs included)
- 🚫 Paid version without ads (future expansion)

---

## Setup ⚙️

### 1. Prerequisites
- Install [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Ensure Android Studio or Xcode is set up for builds
- Run `flutter doctor` to verify environment

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run app
```bash
flutter run
```

---

## Ads Setup 💰

- Currently using **Google AdMob test IDs**
- Replace them with your own AdMob Ad Unit IDs before publishing:
  - Open `lib/services/ads_service.dart`
  - Replace:
    ```dart
    adUnitId: BannerAd.testAdUnitId
    ```
  - With your AdMob banner ad ID.

Docs: [AdMob Flutter](https://pub.dev/packages/google_mobile_ads)

---

## iOS Setup 🍏

In `ios/Runner/Info.plist`, add:

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy</string>
```

Also ensure minimum iOS deployment target is 11.0+.

---

## Android Setup 🤖

In `android/app/src/main/AndroidManifest.xml`, add:

```xml
<meta-data
  android:name="com.google.android.gms.ads.APPLICATION_ID"
  android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
```

Also ensure `minSdkVersion 21` in `android/app/build.gradle`.

---

## Roadmap 🛠️
- Add nostalgic UI themes (Frutiger Aero, McBling, Metalheart, etc.)
- Add playlists, favorites, shuffle/repeat
- Add mass delete & batch editing UI
- Add rewarded ads for unlocking premium themes
- Cloud sync (future)

---

## License 📜
MIT License
