import 'dart:mirrors';

class TestCase {
  final String name;
  int? wasRun;
  late String log;
  TestCase(this.name);
  void setUp() {}
  void run() {
    setUp();
    final m = reflect(this);
    m.invoke(Symbol(name), []);
  }
}

class WasRun extends TestCase {

  WasRun(name): super(name);  

  @override
  void setUp(){
    wasRun = null;
    log = "setUp ";
  }

  void testMethod() {
    wasRun = 1;
    log = "${log}testMethod ";
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  late TestCase _test;
  @override
  void setUp() {
    _test = WasRun("testMethod");
  }

  void testSetUp() {
    _test.run();
    assert(_test.log == "setUp testMethod");
  }
}