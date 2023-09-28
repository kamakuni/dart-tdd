import 'dart:mirrors';

class TestCase {
  final String name;
  TestCase(this.name);
  void setUp() {}
  void run() {
    final m = reflect(this);
    m.invoke(Symbol(name), []);
  }
}

class WasRun extends TestCase {
  int? wasRun;
  int? wasSetUp;
  WasRun(name): super(name);  

  @override
  void setUp(){
    wasRun = null;
    wasSetUp = 1;
  }

  void testMethod() {
    wasRun = 1;
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  late TestCase _test;
  @override
  void setUp() {
    _test = WasRun("testMethod");
  }

  void testRunning() {
    _test = WasRun("testMethod");
    _test.run();
    assert(_test.wasRun == 1);
  }

  void testSetUp() {
    _test = WasRun("testMethod");
    _test.run();
    assert(_test.wasRun == 1);
  }
}