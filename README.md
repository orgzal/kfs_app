# KFS Governorate App

`KFS Governorate App` is a Flutter application that presents a modern digital gateway for Kafr El Sheikh Governorate. The current implementation focuses on a polished Arabic-first experience with right-to-left layout support, section-based navigation, and mock data that can later be replaced with live backend integrations.

## Overview

The app is structured around a public information portal experience. It includes dedicated sections for:

- Home dashboard
- News
- Events
- Government services
- National projects
- Investment opportunities
- Tourism
- Training
- Contact
- Authentication flows

The UI is built with `Flutter` and `GetX`, and the data layer is already separated into providers, services, repositories, models, and feature controllers.

## Current Status

This repository is currently in a prototype or MVP-friendly state:

- The app boots successfully through a GetX-based application shell.
- The default experience is Arabic with RTL rendering.
- Most content is populated through local mock providers.
- Networking primitives are present through `Dio`, but the project is not yet wired to a production backend.
- Some sections still use placeholder views while the navigation shell is already in place.

## Tech Stack

- Flutter
- Dart
- GetX
- Get Storage
- Dio

## Project Structure

```text
lib/
  app.dart
  main.dart
  app/
    core/
      theme/
      values/
      widgets/
    data/
      models/
      providers/
      repositories/
      services/
    modules/
      auth/
      contact/
      events/
      home/
      investment/
      main_shell/
      news/
      projects/
      services/
      splash/
      tourism/
      training/
    routes/
```

More details are documented in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Features

### Implemented

- GetX routing and bindings
- Arabic-first user interface
- Right-to-left layout enforcement
- Home dashboard with multiple content sections
- Section cards for news, events, services, projects, tourism, and investment
- Local persistence bootstrap using `GetStorage`
- Shared theme, color system, and reusable UI widgets

### Planned or Partial

- Full English localization for the UI
- Production API integration
- Real authentication backend
- Search and filtering flows
- Detail pages for list items
- Stronger automated test coverage

## Getting Started

### Prerequisites

- Flutter SDK `3.11.0` or newer
- Dart SDK compatible with the Flutter version above
- Android Studio, VS Code, or another Flutter-compatible IDE

### Installation

```bash
flutter pub get
flutter run
```

### Useful Commands

```bash
flutter analyze
flutter test
flutter build apk
flutter build web
```

## Configuration Notes

- The project currently relies on mock content from `lib/app/data/providers/local_mock_provider.dart`.
- API access can be introduced through the existing provider and service layers.
- Local machine paths such as Android SDK and Flutter SDK should stay untracked via `android/local.properties`.

## Documentation

- [Architecture Guide](docs/ARCHITECTURE.md)
- [Development Setup](docs/SETUP.md)
- [GitHub Publishing Guide](docs/GITHUB_PUBLISHING.md)
- [Contributing Guide](CONTRIBUTING.md)

## Repository Hygiene

This repository is prepared to be published on GitHub with generated files and local machine settings excluded through `.gitignore`.

## License

No license file is included yet. If you plan to make the repository public, choose and add an explicit license before broad distribution.

## Credits

<p align="center">
  <img src="https://j.top4top.io/p_3763jd6hj1.png" alt="Galal Zidan Logo" width="140">
</p>

<p align="center">
  Designed and developed by <strong>Galal Zidan</strong>.
</p>

This project was programmed, structured, and documented by `Galal Zidan`, with a focus on:

- elegant Arabic-first presentation
- scalable Flutter architecture
- clean feature separation
- GitHub-ready documentation and repository structure
