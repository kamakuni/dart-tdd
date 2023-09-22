import 'dart:mirrors';

class TestCase {
  final String name;
  TestCase(this.name);
  void run() {
    final m = reflect(this);
    m.invoke(Symbol(name), []);
  }
}

class WasRun extends TestCase {
  int? wasRun;
  WasRun(name): super(name);  

  void testMethod() {
    wasRun = 1;
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  void testRunning() {
    var test = WasRun("testMethod");
    test.run();
  }

  void testSetUp() {
    var test = WasRun("testMethod");
    test.run();
  }
}