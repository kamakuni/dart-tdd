import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  var test = WasRun("testMethod");
  print(test.wasRun);
  assert(test.wasRun != 1);
  test.run();
  assert(test.wasRun == 1);
  print(test.wasRun);
}
