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
  void run(TestResult result) {
    result.testStarted();
    setUp();
    try {
      final m = reflect(this);
      m.invoke(Symbol(name), []);
    }  catch (e) {
      result.testFailed();
    }
    tearDown();
  }
}

class TestSuite {
  late List<TestCase> tests;
  TestSuite() {
    tests = [];
  }
  void add(TestCase test) {
    tests.add(test);
  }
  void run(TestResult result) {
    tests.forEach((test) {
      test.run(result);
    });
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
    log = "${log}tearDown";
  }

}

class TestCaseTest extends TestCase {
  TestCaseTest(super.name);

  late TestCase _test;
  late TestResult result;

  void setUp() {
    result = TestResult();
  }

  void testTemplateMethod() {
    _test = WasRun("testMethod");
    _test.run(result);
    assert(_test.log == "setUp testMethod tearDown");
  }

  void testResult() {
    _test = WasRun("testMethod");
    _test.run(result);
    assert("1 run, 0 failed" == result.summary());
  }

  void testFailedResult() {
    final test = WasRun("testBrokenMethod");
    test.run(result);
    assert("1 run, 1 failed" == result.summary());
  }

  void testFailedResultFormatting() {
    result.testStarted();
    result.testFailed();
    assert("1 run, 1 failed" == result.summary());
  }

  void testSuite() {
    final suite = TestSuite();
    suite.add(WasRun("testMethod"));
    suite.add(WasRun("testBrokenMethod"));
    suite.run(result);
    assert("2 run, 1 failed" == result.summary());
  }
}