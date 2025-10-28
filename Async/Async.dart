/*
  Concept: Asynchronous Programming (Future & Stream)
  Dart Docs: https://dart.dev/codelabs/async-await

  Description:
  Dart supports async operations using Future, async/await, and Stream for event-driven data.

  Importance for Flutter:
  Flutter frequently loads data from APIs, databases, or Firebase asynchronously.

  Use Cases in Flutter:
  - Fetch data with FutureBuilder
  - Real-time updates with StreamBuilder
  - Delayed tasks or background operations
*/

import 'dart:async';

// Future example
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data Loaded";
}

// Stream example
Stream<int> counterStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print("Fetching...");
  String data = await fetchData();
  print(data);

  await for (int i in counterStream(3)) {
    print("Stream count: $i");
  }

  // Flutter Use Case:
  // FutureBuilder(future: fetchData(), builder: ...)
  // StreamBuilder(stream: counterStream(10), builder: ...)
}
