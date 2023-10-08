import 'dart:mirrors';

class TestResult {
  late int runCount;
  TestCase(){
    runCount = 1;
  }
  String summary() {
    return "1 run, 0 failed";
  }
}

class TestCase {
  final String name;
  late String log;
  TestCase(this.name);
  void setUp() {}
  void tearDown() {}
  TestResult run() {
    setUp();
    final m = reflect(this);
    m.invoke(Symbol(name), []);
    tearDown();
    return TestResult();
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

  @override
  void tearDown() {
    log = "${log}testMethod tearDown";
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  late TestCase _test;

  void testTemplateMethod() {
    _test = WasRun("testMethod");
    _test.run();
    assert(_test.log == "setUp testMethod tearDown");
  }

  void testResult() {
    _test = WasRun("testMethod");
    final result = _test.run();
    assert("1 run, 0 failed" == result.summary());
  }
}