# Hack&Roll 2020: Building Apps with Flutter
An introduction to Dart and Flutter to start building your very own app, abiding by good design principles.

## Pre-Workshop Setup

### 1. Setup

Click on the respective links below and follow the instructions listed under **Get the Flutter SDK**, **Update your path** and **Run flutter doctor** only.

Flutter set up instructions:
* [Windows](!https://flutter.dev/docs/get-started/install/windows#get-sdk)
* [macOS](!https://flutter.dev/docs/get-started/install/macos#get-sdk)
* [Linux](!https://flutter.dev/docs/get-started/install/linux#get-sdk)

### 2. Set up an IDE

[Visual Studio Code](!https://code.visualstudio.com/) is the recommended IDE. Download it and install it for your respective platforms.

Install the Flutter and Dart plugins:
* Start VS Code.
* Invoke View > Command Palette….
* Type “install”, and select Extensions: Install Extensions.
* Type “flutter” in the extensions search field, select Flutter in the list, and click Install. This also installs the required Dart plugin.

## Agenda
* [Dart Basics](#dart-basics)
* [Basic Structure](#basic-structure)
* [Building an Infinite List](#building-an-infinite-list)
* [Adding Interactivity](#adding-interactivity)
* [Navigation](#navigation)
* [Intro to BLoC Pattern](#intro-to-bloc-pattern)
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
```
int sum(int a, int b) {
  return a + b;
}
```

**Type omitted**
```
sum(a, b) {
  return a + b;
}
```

**Arrow syntax**
```
int sum(int a, int b) => a + b;
```

### Parameters

**Required Parameters**
```
int sum(int a, int b, int c) {
  return a + b + c;
}

sum(1, 2, 3);
```

**Optional Positional Parameters**
```
int sum(int a, int b, {int c = 0}) {
  return a + b + c;
}

sum(a: 1, b: 2);
```

**Optional Named Parameters**
```
int sum(int a, int b, [int c = 0]) {
  return a + b + c;
}

sum(1, 2);
```

### Interesting/Important Operators

#### 1. Conditional Expressions

**condition ? expr1 : expr2**
```
String getPlayerName(int i) {
  return (names[i] == null) ? 'Guest' : names[i];
}
```

**expr1 ?? expr2**
```
String getPlayerName(int i) {
  return names[i] ?? 'Guest';
}
```

#### 2. Assignment Operators
```
// Assign value to a
a = value;
// Assign value to b if b is null; otherwise, b stays the same
b ??= value;
```

## Basic Structure

### App Lifecycle
[](!https://i.stack.imgur.com/94idE.png)

### Create an App
```
$ flutter create -i swift -a kotlin list_app
```

## Building an Infinite List
```
ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(i);
      }
    );
```
```
Widget _buildRow(int i) {
    return ListTile(
      title: Text(
        i.toString(),
      ),
    );
  }
```

## Adding Interactivity
```
var values = Map();
```

```
setState(() {
    if (values.containsKey(i))
      values[i] = !values[i];
    else
      values.putIfAbsent(i, () => true);
  });
``` 
