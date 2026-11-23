import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_nisan_antrenmani/oyun_nisan_antrenmani.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(nisanConfig.title.length, 33);
    expect(nisanConfig.tagline.length, 33);
    for (final s in nisanConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(nisanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: nisanId, optionalMechanics: nisanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(nisanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
