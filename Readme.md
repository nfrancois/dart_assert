#Dart Assert

Dart Assert provides a rich and intuitive set of strongly typed assertions to use for unit testing. Inspired by AssertJ.

Distributed under the Apache 2.0 License.

## Getting Started

Create a Dart project and add a **pubspec.yaml** file to it

```
dependencies:
  dart_assert: any
```

and run

```
pub install
```

## Samples

```dart
import 'package:assert_dart/assert_dart.dart';


assertThisObject("Dart")..isNotNull()
                         ..isEqualTo("Dart")
                         ..isNotEqualsTo("dart")
                         ..satisfies((String word) => world.startsWith("D"))
                         ..doesNotSatisfies((String word) => world.length == 5);

```