
# Posts App With Clean Architecture And Cubit
- The Posts app is a simple app that implements the "Clean Architecture concepts" That has been introduced by [Uncle Bob (Robert C. Martin)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) ٫
The application fetches data from the API in the case of the presence of the Internet and stores it in a database. In the case of offline mode, it fetches data from the previously stored database.

## Screenshots
<img src="https://i.ibb.co/bNLR0Jh/Screenshot-1684007601.png" width="250">&nbsp;
<img src="https://i.ibb.co/Zz6dxwf/Screenshot-2023-05-13-at-2-32-33-PM.png" width="720">&nbsp;
<img src="https://i.ibb.co/mv4MSW4/1-0u-ek-VHFu7-Om7-Z-VTw-FHvg.webp" width="720">&nbsp;
<img src="https://i.ibb.co/fMkTzjZ/Screenshot-2023-05-11-at-4-53-22-AM.png" width="1280">&nbsp;


## Built With

* [Bloc (cubit)](https://pub.dev/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.
* [get_it](https://pub.dev/packages/get_it) - Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App .
* [Dartz](https://pub.dev/packages/dartz) - Functional Programming in Dart. Purify your Dart code using efficient immutable data structures, monads, lenses and other FP tools.
* [Equatable](https://pub.dev/packages/equatable) - A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.
* [Http Package](https://pub.dev/packages/http) - A composable, multi-platform, Future-based API for HTTP requests.
* [Internet Connection Checker](https://pub.dev/packages/internet_connection_checker) - A pure Dart library that checks for internet by opening a socket to a list of specified addresses, each with individual port and timeout. Defaults are provided for convenience.
* [Shared preferences plugin](https://pub.dev/packages/shared_preferences) - Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.

