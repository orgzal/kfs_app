# Architecture Guide

## High-Level Design

The application uses a layered Flutter architecture built around `GetX` for routing, dependency binding, and controller-driven presentation logic.

At a high level, the codebase is organized into:

- `core`: shared theme, constants, and reusable widgets
- `data`: models, providers, repositories, and services
- `modules`: feature-specific views, controllers, and bindings
- `routes`: central route declarations and route registration

## Application Bootstrap

The entry flow starts in `lib/main.dart`:

1. Flutter bindings are initialized.
2. `GetStorage` is initialized.
3. `KfsGovernorateApp` is launched.

`lib/app.dart` configures:

- `GetMaterialApp`
- Theme registration
- Supported locales
- Default and fallback locale settings
- Central page routing
- Global RTL direction wrapping

## Routing Model

Routes are defined in:

- `lib/app/routes/app_routes.dart`
- `lib/app/routes/app_pages.dart`

The application uses named routes and GetX bindings so that each page can resolve its own controller dependencies.

## Module Pattern

Most features follow a GetX-oriented module structure:

```text
module/
  bindings/
  controllers/
  views/
```

This keeps feature concerns grouped together and makes navigation and dependency registration more explicit.

## Data Layer

The data layer is intentionally separated even though the current project still relies heavily on mock data.

### Providers

Providers are responsible for raw data access:

- `local_mock_provider.dart` supplies in-memory demo content
- `api_provider.dart` is the base for remote HTTP access

### Services

Services wrap technical access concerns:

- `network_service.dart` exposes `Dio`-based request helpers
- `storage_service.dart` is intended for local persistence flows

### Repositories

Repositories provide domain-oriented access to data for features such as:

- home
- news
- events
- services
- projects
- investment
- tourism

This makes it easier to replace mock data with a real API later without rewriting the views.

## UI Composition

The UI layer is driven by reusable elements from `lib/app/core/widgets/` and themed through `lib/app/core/theme/`.

Current UI traits include:

- Arabic-first typography and copy
- Right-to-left page direction
- Shared color palette and branded surfaces
- Scrollable dashboard sections
- Reusable cards for content entities

## Current Architectural Constraints

The current codebase is well-prepared for expansion, but several areas are still transitional:

- Some routes point to shared shell placeholders instead of dedicated detail pages.
- Content is mostly mock-driven.
- Localization is configured, but the interface text is still largely hardcoded.
- Test coverage is minimal.

## Recommended Next Steps

1. Replace hardcoded UI strings with Flutter localization resources.
2. Connect repositories to real endpoints through `ApiProvider` and `NetworkService`.
3. Add dedicated detail screens for news, events, projects, and services.
4. Add widget and controller tests for critical flows.
5. Introduce environment configuration for staging and production APIs.
