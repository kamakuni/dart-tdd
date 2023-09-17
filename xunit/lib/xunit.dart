class WasRun {
  late String name;
  late int? wasRun;
  WasRun(String name){
    name = name;
    wasRun = null;
  }

  void testMethod() {
    wasRun = 1;
  }

  void run() {
    testMethod();
  }
}