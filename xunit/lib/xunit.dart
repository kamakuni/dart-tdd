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
  int? wasSetUp;
  WasRun(name): super(name);  

  void setUp(){
    wasSetUp = 1;
  }

  void testMethod() {
    wasRun = 1;
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  void testRunning() {
    var test = WasRun("testMethod");
    assert(test.wasRun != 1);
    test.run();
    assert(test.wasRun == 1);
  }

  void testSetUp() {
    var test = WasRun("testMethod");
    assert(test.wasRun != 1);
    test.run();
    assert(test.wasRun == 1);
  }
}