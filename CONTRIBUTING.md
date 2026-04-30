# Contributing

## Scope

This project is a Flutter application for showcasing services, initiatives, and public information related to Kafr El Sheikh Governorate.

Contributions should preserve:

- Arabic-first usability
- Right-to-left layout correctness
- Clear separation between UI, controllers, repositories, and providers
- Reusable and consistent design patterns

## Development Workflow

1. Create a feature branch from `main`.
2. Keep each branch focused on one change set.
3. Run static analysis and tests before opening a pull request.
4. Update documentation when behavior, setup, or architecture changes.

## Recommended Checks

```bash
flutter pub get
flutter analyze
flutter test
```

## Code Style

- Follow the lints defined in `analysis_options.yaml`.
- Prefer small, focused widgets over large monolithic views.
- Keep feature state inside GetX controllers.
- Keep networking and persistence logic out of UI widgets.
- Reuse shared widgets and theme tokens from `lib/app/core/`.

## Pull Request Expectations

Each pull request should include:

- A short summary of the change
- The reason for the change
- Screenshots or screen recordings for UI changes when relevant
- Notes about any follow-up work

## Documentation Rule

If you change project structure, setup steps, or public behavior, update the relevant file in `docs/` as part of the same pull request.
