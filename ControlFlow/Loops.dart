void Loop() {
  var callbacks = [];
  for (int i = 0; i < 10; i++) {
    callbacks.add(() => print('Callback $i'));
  }
}
