import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  TestCaseTest("testTemplateMethod").run();
  TestCaseTest("testResult").run();
  //TestCaseTest("testFailedResult").run();
  TestCaseTest("testFailedResultFormatting").run();
}
