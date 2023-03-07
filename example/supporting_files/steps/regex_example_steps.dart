import 'package:gherkin/gherkin.dart';

final frenchRegexExampleSteps = [
  givenACalculator(),
  whenAddition(),
  thenResult(),
];

int expectedTotal = 0;

StepDefinitionGeneric<World> givenACalculator() {
  return given<World>(RegExp(r"une calculatrice$"), (context) async {});
}

StepDefinitionGeneric<World> givenABigCalculator() {
  return given<World>(RegExp(r"^une grande calculatrice$"), (context) async {});
}

StepDefinitionGeneric<World> whenAddition() {
  return when2<String, String, World>(RegExp(r"on ajoute (\d) et (\d)$"),
      (nb1, nb2, context) async {
    expectedTotal = int.parse(nb1) + int.parse(nb2);
  });
}

StepDefinitionGeneric<World> thenResult() {
  return then1<String, World>(RegExp(r"on affiche (\d)$"), (total, context) async {
    assert(int.parse(total) == expectedTotal);
  });
}
