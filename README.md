# Seven Solutions Test

Hi, I'm Nattapong Sawatraksa.
I'm currently work as a Senior Flutter Developer at LivingInsider co.

Please read README since it shows details about my project decisions, including:

You can contact me through:
- Email: nattapong.sawa@gmail.com
- Phone: 0870411488
- LinkedIn: [Nattapong Sawatraksa](https://www.linkedin.com/in/nattapong-sawatraksa-139168191/)

## Environment Setup

- Flutter: 3.24.5
- Dart: 3.5.4
- DevTools: 2.37.3

## Architecture Decision

## Design Decisions


I decided to not use any third-party libraries to challenge myself. You may find potential bugs or edge cases in ScrollToIndex since it uses widget sizes to manually calculate offsets. However, in real-world applications, I would prefer using the `scrollable_positioned_list` package developed by the Google team.
- Implemented custom scroll-to-index functionality without external libraries
    - Manual offset calculation using widget sizes
    - Potential edge cases with dynamic content sizes
    - In production, would recommend `scrollable_positioned_list` package by Google
- Pure Flutter implementation to demonstrate core framework understanding
- Minimalist approach focusing on essential functionality

### Project Structure
```
lib/
├── core/           # Core functionality, extensions, and utilities
├── feature/        # Feature-based modules
│   └── fibonacci/  # Fibonacci feature module
│       ├── model/        # Data models
│       ├── presentation/ # UI layer (screens, widgets)
│       └── view_model/   # Business logic and state management
└── main.dart       # Application entry point
```

### Design Patterns & Architecture

- **MVVM Pattern**: Using ViewModel for business logic separation
- **Feature-first Structure**: Organized by features for better scalability
- **Repository Pattern**: For data handling (if needed in future)
- **Clean Architecture Principles**: Separation of concerns between UI, business logic, and data

For this project, I chose a feature-based structure adhering to Clean Architecture principles, combined with MVVM and Repository patterns for optimal code organization and maintainability. This architecture promotes:

- Clear separation of concerns
- Easy feature isolation and testing
- Scalable codebase structure
- Maintainable business logic
- Dependency management

### State Management
#### Current Implementation
- Implemented with `ChangeNotifier` and `ListenableBuilder` for simplicity
- Lightweight solution for this demo project

#### Production Preference
- BLoC or Riverpod for complex applications
- Better state management features
- More robust error handling
- Enhanced testability
- Proper dependency injection