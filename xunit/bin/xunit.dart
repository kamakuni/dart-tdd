import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  TestCaseTest("testTemplateMethod").run().summary();
  TestCaseTest("testResult").run().summary();
  TestCaseTest("testFailedResult").run().summary();
  TestCaseTest("testFailedResultFormatting").run().summary();
}
