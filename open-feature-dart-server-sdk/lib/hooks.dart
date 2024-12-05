// Hook interface and default hooks.
abstract class OpenFeatureHook {
  /// Logic to execute before a flag is evaluated.
  void beforeEvaluation(String flagKey, Map<String, dynamic>? context);

  /// Logic to execute after a flag is evaluated.
  void afterEvaluation(
      String flagKey, dynamic result, Map<String, dynamic>? context);
}

/// Example AuditHook implementation
class OpenFeatureAuditHook implements OpenFeatureHook {
  @override
  void beforeEvaluation(String flagKey, Map<String, dynamic>? context) {
    print('Before evaluating flag: $flagKey');
  }

  @override
  void afterEvaluation(
      String flagKey, dynamic result, Map<String, dynamic>? context) {
    print('After evaluating flag: $flagKey, Result: $result');
  }
}