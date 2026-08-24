# OpenClaw Go

An Android AI agent application built with Jetpack Compose.

## Features

- 🤖 AI Agent interface with text input and response display
- 🔄 Background service for continuous agent operation
- 📱 Modern Material Design 3 UI with Jetpack Compose
- 🔔 Foreground service with notifications

## Requirements

- Android Studio Hedgehog or later
- JDK 17 or later
- Android SDK 34 (API 34)
- Minimum Android 7.0 (API 24)

## Setup

### 1. Generate Gradle Wrapper (if missing)

If the `gradle/wrapper/gradle-wrapper.jar` file is missing, run:

```bash
./setup-wrapper.sh
```

Or if you have Gradle installed:

```bash
gradle wrapper --gradle-version 8.2
```

### 2. Build the Project

```bash
# Debug build
./gradlew assembleDebug

# Release build
./gradlew assembleRelease
```

### 3. Install on Device

```bash
# Install debug build
./gradlew installDebug

# Or install release build
./gradlew installRelease
```

## Project Structure

```
OpenClawGo/
├── app/
│   ├── src/main/
│   │   ├── java/com/openclaw/go/
│   │   │   ├── MainActivity.kt       # Main UI with Compose
│   │   │   └── AgentService.kt       # Background agent service
│   │   ├── res/
│   │   │   ├── values/               # Strings, colors, themes
│   │   │   ├── mipmap-*/             # Launcher icons
│   │   │   └── drawable/             # Vector drawables
│   │   └── AndroidManifest.xml
│   ├── build.gradle.kts
│   └── proguard-rules.pro
├── gradle/wrapper/
├── build.gradle.kts
├── settings.gradle.kts
└── gradle.properties
```

## Architecture

- **MainActivity**: Main entry point with Jetpack Compose UI
  - Text input field for user queries
  - "Run Agent" button to trigger AI processing
  - Response card to display results
  
- **AgentService**: Foreground service for background operations
  - Runs AI agent in the background
  - Shows persistent notification
  - Uses `dataSync` foreground service type

## Permissions

The app requires the following permissions:

- `INTERNET` - For API calls to AI services
- `FOREGROUND_SERVICE` - For running the agent service
- `POST_NOTIFICATIONS` - For service notifications (Android 13+)

## Building APK

### Using Gradle

```bash
./gradlew clean assembleRelease
```

The APK will be available at:
```
app/build/outputs/apk/release/app-release.apk
```

### Using GitHub Actions

The repository includes a GitHub Actions workflow that automatically builds the APK on every push. The APK is uploaded as an artifact.

## Development

### Code Style

- Kotlin with official style guide
- Jetpack Compose for UI
- Material Design 3 components

### Testing

```bash
# Run unit tests
./gradlew test

# Run instrumented tests
./gradlew connectedAndroidTest
```

### Clean Build

```bash
./gradlew clean
```

## Troubleshooting

### Gradle Wrapper Missing

Run `./setup-wrapper.sh` or `gradle wrapper --gradle-version 8.2`

### Build Fails with Java Version Error

Ensure you're using JDK 17:
```bash
java -version
# Should show version 17.x.x
```

### SDK Location Not Found

Create a `local.properties` file in the project root:
```properties
sdk.dir=/path/to/Android/Sdk
```

## License

This project is open source.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
