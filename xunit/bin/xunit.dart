import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  var test = WasRun("testMethod");
  print(test.wasRun);
  test.run();
  print(test.wasRun);
}