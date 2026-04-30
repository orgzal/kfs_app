# Development Setup

## Requirements

- Flutter SDK `3.11.0` or newer
- A working Android, iOS, web, Windows, Linux, or macOS Flutter toolchain
- Git

## Clone and Install

```bash
git clone <your-repository-url>
cd kfs_governorate_app
flutter pub get
```

## Run the App

```bash
flutter run
```

If more than one device is available:

```bash
flutter devices
flutter run -d <device-id>
```

## Static Analysis and Tests

```bash
flutter analyze
flutter test
```

## Build Commands

```bash
flutter build apk
flutter build appbundle
flutter build web
flutter build windows
```

## Local Configuration

The file `android/local.properties` is machine-specific and should not be committed. It usually contains:

- Android SDK path
- Flutter SDK path

## Switching from Mock Data to Live APIs

The codebase already contains the building blocks for remote integration:

- `lib/app/data/providers/api_provider.dart`
- `lib/app/data/services/network_service.dart`
- feature repositories under `lib/app/data/repositories/`

Recommended migration path:

1. Define API base configuration in the provider layer.
2. Replace mock provider calls inside repositories.
3. Keep models as the data contract between remote data and UI.
4. Add error handling states in controllers and views.
