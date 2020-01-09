# Hack&Roll 2020: Building Apps with Flutter
An introduction to Dart and Flutter to start building your very own app, abiding by good design principles.

## Pre-Workshop Setup

### 1. Setup

Click on the respective links below and follow the instructions listed under **Get the Flutter SDK**, **Update your path** and **Run flutter doctor** only.

Flutter set up instructions:
* [Windows](https://flutter.dev/docs/get-started/install/windows#get-sdk)
* [macOS](https://flutter.dev/docs/get-started/install/macos#get-sdk)
* [Linux](https://flutter.dev/docs/get-started/install/linux#get-sdk)

### 2. Set up an IDE

[Visual Studio Code](https://code.visualstudio.com/) is the recommended IDE. Download it and install it for your respective platforms.

Install the Flutter and Dart plugins:
* Start VS Code.
* Invoke View > Command Palette….
* Type “install”, and select Extensions: Install Extensions.
* Type “flutter” in the extensions search field, select Flutter in the list, and click Install. This also installs the required Dart plugin.

## Agenda
* [Dart Basics](#dart-basics)
    * Built-in types
    * Functions
    * Parameters
    * Interesting/Important Operators
* [Basic Structure](#basic-structure)
    * App Lifecycle
    * Create an App
* [Building an Infinite List](#building-an-infinite-list) 
* [Adding Interactivity](#adding-interactivity)
* [Navigation](#navigation)
    * Pushing a Route
    * Popping the Stack
* [Send Data to a New Screen](#send-data-to-a-new-screen)
    * Sending Data Forward
    * Sending Data Backward
* [Intro to RxDart + BLoC Pattern](#intro-to-rxdart--bloc-pattern)
* [Asynchronous Functions](#asynchronous-functions)
* [Making API Calls](#making-api-calls)
* [Building a Weather App Using BLoC Pattern](#building-a-weather-app)
* [Common Pitfalls](#common-pitfalls)

## Dart Basics
Read up on all the syntax [here](!https://dart.dev/guides/language/language-tour).

### Built-in types

The Dart language has special support for the following types:

* int
* double
* strings
* booleans
* lists
* sets
* maps
* runes (for expressing Unicode characters in a string)
* symbols

### Functions

**Type annotated**
```dart
int sum(int a, int b) {
  return a + b;
}
```

**Type omitted**
```dart
sum(a, b) {
  return a + b;
}
```

**Arrow syntax**
```dart
int sum(int a, int b) => a + b;
```

### Parameters

**Required Parameters**
```dart
int sum(int a, int b, int c) {
  return a + b + c;
}

sum(1, 2, 3);
```

**Optional Positional Parameters**
```dart
int sum(int a, int b, {int c = 0}) {
  return a + b + c;
}

sum(a: 1, b: 2);
```

**Optional Named Parameters**
```dart
int sum(int a, int b, [int c = 0]) {
  return a + b + c;
}

sum(1, 2);
```

### Interesting/Important Operators

#### 1. Conditional Expressions

**condition ? expr1 : expr2**
```dart
String getPlayerName(int i) {
  return (names[i] == null) ? 'Guest' : names[i];
}
```

**expr1 ?? expr2**
```dart
String getPlayerName(int i) {
  return names[i] ?? 'Guest';
}
```

#### 2. Assignment Operators
```dart
// Assign value to a
a = value;
// Assign value to b if b is null; otherwise, b stays the same
b ??= value;
```

## Basic Structure

### App Lifecycle
![](https://i.stack.imgur.com/94idE.png)
_**From [Stack Overflow](https://stackoverflow.com/questions/41479255/life-cycle-in-flutter)**_
### Create an App
```dart
$ flutter create -i swift -a kotlin list_app
```

## Building an Infinite List
```dart
ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(i);
      }
    );
```
```dart
Widget _buildRow(int i) {
    return ListTile(
      title: Text(
        i.toString(),
      ),
    );
  }
```

## Adding Interactivity
```dart
var values = Map();
```

```dart
setState(() {
    if (values.containsKey(i))
      values[i] = !values[i];
    else
      values.putIfAbsent(i, () => true);
  });
``` 

## Navigation
![](https://dpzbhybb2pdcj.cloudfront.net/windmill/v-9/Figures/navigator_push_pop.png)
_**From [Flutter in Action](https://livebook.manning.com/book/flutter-in-action/welcome/v-9/)**_

### Pushing a Route
```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
```

### Popping the Stack
```dart
Navigator.pop(context);
```

## Send Data to a New Screen
### Sending Data Forward
```dart
class DetailsPage extends StatefulWidget {
  final String pageName, index;

  DetailsPage(this.index, this.pageName);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
      ),
      body: Center(
        child: Text(widget.index),
      ),
    );
  }
}
```

### Sending Data Backward
**Using Navigator**
```data
Navigator.pop(context, widget.index);
```

**Using Parent Function**
```dart
class DetailsPage extends StatefulWidget {
  final String pageName, index;
  final Function updateValue;

  DetailsPage(this.index, this.pageName, this.updateValue);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.updateValue(widget.index);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageName),
        ),
        body: Center(
          child: Text(widget.index),
        ),
      ),
    );
  }
}
```

## Intro to RxDart + BLoC Pattern
The information and graphics from this section are from [here](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/). Read the article there for a more detailed coverage.

Add ```rxdart: ^0.23.1``` to pubspec.yaml. 

### BLoC Pattern
BLoC stands for **B**usiness **Lo**gic **C**omponent.

**Advantages**
1. Decoupled from the UI Layer
2. Better segmentation of app logic
3. Makes use of streams for input and output

![](https://www.didierboelens.com/images/streams_bloc.png)

### RxDart
The pipe is known as a ```Stream```. A stream is controlled with a ```StreamController```. The ```StreamController``` exposes the ```Sink``` for input. There are three types of ```StreamControllers``` - ```PublishSubject```, ```BehaviorSubject```, ```ReplaySubject```.

![](https://www.didierboelens.com/images/S.PublishSubject.png)

![](https://www.didierboelens.com/images/S.BehaviorSubject.png)

![](https://www.didierboelens.com/images/S.ReplaySubject.png)

### Implementation Sample
Copy the ```blocs``` folder to the ```lib``` folder.
```dart
class SampleBloc implements BlocBase {
  int _counter;
  
  // Stream to handle the counter
  Final _counterController = BehaviorSubject<int>();
  Sink<int> get inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  // Constructor
  SampleBloc() {
    _counter = 0;
    _counterController.stream.listen(_handleLogic);
  }

  @override
  void dispose() {
    _counterController.close();
  }

  void _handleLogic(data) {
    ...
  }
}
```

## Asynchronous Functions
A ```Future``` represents the result of an asynchronous operation, and can have two states: uncompleted or completed.

The ```async``` keyword appears before a function body to mark that function as asynchronous.

The ```await``` keyword can appear before an asynchronous function to get the completed result.

```dart
Future<String>  createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}
```

## Making API Calls
Add ```dio: ^3.0.8``` to pubspec.yaml.
```dart
Future<String> fetchWeatherForecast() async {
    String weatherApiUrl =
        "https://api.data.gov.sg/v1/environment/2-hour-weather-forecast";
    String forecast;
    Dio dio = Dio();

    RequestOptions requestOptions = RequestOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
        method: 'GET',
        responseType: ResponseType.json,
        validateStatus: (status) {
          return status == 200;
        });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(InterceptorsWrapper(onResponse: (Response response) {
      if (response.statusCode == 200) {
        var forecasts = response.data["items"][0]["forecasts"];
        forecast = items.where((map) => map["area"] == "Clementi")[0]["forecast"];
      }
      return response;
    }));

    try {
      await dio.get(weatherApiUrl, options: requestOptions);
    } catch (e) {
      _handleError(e);
      return List();
    }

    return forecast;
  }
  ```
