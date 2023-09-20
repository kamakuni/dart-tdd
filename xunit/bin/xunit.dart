import 'package:xunit/xunit.dart';

void main(List<String> arguments) {
  var test = WasRun("testMethod");
  print(test.wasRun);
  assert(!test.wasRun);
  test.run();
  assert(test.wasRun);
  print(test.wasRun);
}
