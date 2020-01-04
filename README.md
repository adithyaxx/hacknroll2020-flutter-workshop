# Hack&Roll 2020: Building Apps with Flutter
A self-contained introduction to Dart and Flutter

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

## Dart Basics

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