import 'dart:mirrors';

class TestResult {
  late int runCount;
  late int errorCount;
  TestResult() {
    runCount = 0;
    errorCount = 0;
  }
  void testStarted() {
    runCount = runCount + 1;
  }
  void testFailed() {
    errorCount = errorCount + 1;
  }
  String summary() {
    return "$runCount run, $errorCount failed";
  }
}

class TestCase {
  final String name;
  late String log;
  TestCase(this.name);
  void setUp() {}
  void tearDown() {}
  TestResult run() {
    final result = TestResult();
    result.testStarted();
    setUp();
    try {
      final m = reflect(this);
      m.invoke(Symbol(name), []);
    }  catch (e) {
      result.testFailed();
    }
    tearDown();
    return result;
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

  void testBrokenMethod() {
    throw Exception();
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

  void testFailedResult() {
    final test = WasRun("testBrokenMethod");
    final result = test.run();
    assert("1 run, 0 failed" == result.summary());
  }

  void testFailedResultFormatting() {
    final result = TestResult();
    result.testStarted();
    result.testFailed();
    assert("1 run, 1 failed" == result.summary());
  }
}