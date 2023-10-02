import 'dart:mirrors';

class TestCase {
  final String name;
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
    log = "setUp ";
  }

  void testMethod() {
    log = "${log}testMethod ";
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  late TestCase _test;

  void testTemplateMethod() {
    _test = WasRun("testMethod");
    _test.run();
    assert(_test.log == "setUp testMethod");
  }
}