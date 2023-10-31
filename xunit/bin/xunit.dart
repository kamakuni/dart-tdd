import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  print(TestCaseTest("testTemplateMethod").run().summary());
  print(TestCaseTest("testResult").run().summary());
  print(TestCaseTest("testFailedResult").run().summary());
  print(TestCaseTest("testFailedResultFormatting").run().summary());
}
