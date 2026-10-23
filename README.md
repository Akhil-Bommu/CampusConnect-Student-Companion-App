# CampusConnect — Student Companion App

## Abstract

**CampusConnect** is a Flutter-based mobile application designed to simplify everyday student activities by bringing essential features into one place. It provides a simple and user-friendly interface for accessing college events, viewing announcements, and managing personal tasks.

Students can explore upcoming events, check announcements, add and manage tasks, and mark tasks as completed. The application also integrates a REST API to fetch and display dynamic announcement data.

The project demonstrates practical Flutter and Dart concepts, including widgets, responsive layouts, navigation, forms and validation, state management, reusable custom widgets, themes, and animations. Provider is used for state management to maintain a structured and organized application.

CampusConnect is developed as a hands-on learning project to understand how Flutter concepts work together to build a functional mobile application and to establish a foundation for future enhancements.

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Provider
- **API Integration:** REST API

## Getting Started

1. Install [Flutter](https://docs.flutter.dev/get-started/install).
2. Clone this repository.
3. Navigate to the project directory.
4. Install the dependencies:

   ```bash
   flutter pub get
   ```

5. Run the application:

   ```bash
   flutter run
   ```

## Future Enhancements

Additional student-focused features and improvements can be introduced as the project evolves.

## Experiment 1 – Flutter Setup and Dart Basics

### 1a. Flutter and Dart installation
Installed the Flutter SDK (Dart is bundled with it) and verified the setup using `flutter doctor`. Created the project with `flutter create` and ran the default app.

![flutter doctor](screenshots/exp1/01_flutter_doctor.png)
![default app](screenshots/exp1/02_default_app.png)

### 1b. Dart basics
`dart_basics/basics.dart` demonstrates variables, data types, a list, a function, a class, a loop and an if condition.

![code](screenshots/exp1/03_basics_code.png)
![output](screenshots/exp1/04_basics_output.png)

## Experiment 2 – Widgets and Layouts

### 2a. Basic widgets
Used `Text`, `Image`, `Container` and `Icon` on the Home screen (`lib/screens/home_screen.dart`). `Container` is styled with padding, color, border and rounded corners.

![widgets code](screenshots/exp2/01_widgets_code.png)
![widgets output](screenshots/exp2/02_widgets_output.png)

### 2b. Layouts using Row, Column and Stack
Used a `Row` of `Column` items for quick actions, and a `Stack` with `Positioned` to place a label over an image.

![layouts code](screenshots/exp2/03_layouts_code.png)
![layouts output](screenshots/exp2/04_layouts_output.png)

## Experiment 3 – Responsive UI

### 3a. Responsive layout
The Events screen (`lib/screens/events_screen.dart`) uses `LayoutBuilder` to show a single-column list on small screens and a 2-column grid on wide screens.

![layoutbuilder code](screenshots/exp3/01_layoutbuilder_code.png)
![phone view](screenshots/exp3/02_phone_view.png)
![wide view](screenshots/exp3/03_wide_view.png)

### 3b. MediaQuery and breakpoints
Used `MediaQuery` to read the screen width and defined breakpoints at 600 px and 900 px: 1 column below 600, 2 columns from 600 to 899, and 3 columns from 900 up. Padding also increases on larger screens.

![mediaquery code](screenshots/exp3/04_mediaquery_code.png)
![one column](screenshots/exp3/05_one_column.png)
![three columns](screenshots/exp3/06_three_columns.png)

## Experiment 4 – Navigation

### 4a. Navigator
The Home screen buttons open the Events, Announcements and Tasks screens using `Navigator.push` with `MaterialPageRoute`. `Navigator.pop` returns to the previous screen (Go Back button on the Tasks screen).

![push code](screenshots/exp4/01_push_code.png)
![home screen](screenshots/exp4/02_home_screen.png)
![tasks screen](screenshots/exp4/03_tasks_screen.png)

### 4b. Named routes
All screens are registered in the `routes` map in `main.dart` (`/`, `/events`, `/announcements`, `/tasks`) and opened with `Navigator.pushNamed`.

![routes code](screenshots/exp4/04_routes_code.png)
![pushNamed code](screenshots/exp4/05_pushnamed_code.png)
![events via route](screenshots/exp4/06_events_via_route.png)

## Experiment 5 – State Management

### 5a. Stateless and stateful widgets
`HomeScreen` and `EventsScreen` are stateless (fixed content). `TasksScreen` was built as a `StatefulWidget`: the task list lives in its `State` class, and ticking a task calls `setState` so the screen rebuilds with the strikethrough.

![stateful code](screenshots/exp5/01_stateful_code.png)
![tasks unchecked](screenshots/exp5/02_tasks_unchecked.png)
![tasks checked](screenshots/exp5/03_tasks_checked.png)

### 5b. setState and Provider
`setState` only works for data inside one screen. To share tasks across screens, the data moved into `TaskProvider` (a `ChangeNotifier`), made available in `main.dart` with `ChangeNotifierProvider`. The Tasks screen uses `context.watch` to display tasks and `context.read` to toggle them. The Home screen also watches the provider, so the pending-task count updates automatically.

![provider code](screenshots/exp5/04_provider_code.png)
![provider usage](screenshots/exp5/05_provider_usage_code.png)
![home pending count](screenshots/exp5/06_home_pending_count.png)

## Experiment 6 – Custom Widgets and Themes

### 6a. Custom widgets
Created two reusable widgets in `lib/widgets/`: `EventCard` (used on the Events screen) and `TaskTile` (used on the Tasks screen). Each takes its data through the constructor, so the same widget is reused for every event and task.

![event card code](screenshots/exp6/01_eventcard_code.png)
![task tile code](screenshots/exp6/02_tasktile_code.png)
![events screen](screenshots/exp6/03_events_screen.png)
![tasks screen](screenshots/exp6/04_tasks_screen.png)

### 6b. Themes and custom styles
`lib/theme/app_theme.dart` defines light and dark `ThemeData` (colors from a seed color, app bar, text and button styles) and an `AppStyles` class for shared values like corner radius and padding. Screens read colors and text styles from `Theme.of(context)` instead of hard-coding them.

![theme code](screenshots/exp6/05_theme_code.png)
![light theme](screenshots/exp6/06_themed_home.png)
![dark theme](screenshots/exp6/07_dark_mode.png)