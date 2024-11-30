/* Tests for providers and NoOpProvider.
Verifies that the NoOpProvider returns the correct metadata (name).
Ensures all flag evaluation methods in NoOpProvider return their respective default values:*/

import 'package:test/test.dart';
import '../lib/feature_provider.dart';

void main() {
  group('FeatureProvider Tests', () {
    late FeatureProvider noOpProvider;

    setUp(() {
      // Initialize the NoOpProvider for each test
      noOpProvider = NoOpProvider();
    });

    test('NoOpProvider has correct metadata', () {
      final metadata = noOpProvider.metadata;

      expect(metadata.name, equals('NoOpProvider'),
          reason: 'NoOpProvider should return correct metadata name.');
    });

    test('NoOpProvider boolean flag returns default value', () async {
      final result = await noOpProvider.getBooleanFlag('test-flag');
      expect(result, isFalse,
          reason:
              'NoOpProvider should return false for boolean flags by default.');
    });

    test('NoOpProvider string flag returns default value', () async {
      final result = await noOpProvider.getStringFlag('test-flag');
      expect(result, equals(''),
          reason: 'NoOpProvider should return an empty string by default.');
    });

    test('NoOpProvider integer flag returns default value', () async {
      final result = await noOpProvider.getIntegerFlag('test-flag');
      expect(result, equals(0),
          reason: 'NoOpProvider should return 0 for integer flags by default.');
    });

    test('NoOpProvider double flag returns default value', () async {
      final result = await noOpProvider.getDoubleFlag('test-flag');
      expect(result, equals(0.0),
          reason:
              'NoOpProvider should return 0.0 for double flags by default.');
    });

    test('NoOpProvider object flag returns default value', () async {
      final result = await noOpProvider.getObjectFlag('test-flag');
      expect(result, isNull,
          reason:
              'NoOpProvider should return null for object flags by default.');
    });
  });
}
