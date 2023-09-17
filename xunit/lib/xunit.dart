import 'dart:mirrors';

class WasRun {
  final String name;
  int? wasRun;
  WasRun(this.name);

  void testMethod() {
    wasRun = 1;
  }

  void run() {
    var m = reflect(this);
    print(name);
    m.invoke(Symbol(name),[]);
  }
}