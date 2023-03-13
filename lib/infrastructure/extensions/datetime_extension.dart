///
/// DateTime extension
///
extension DateTimeExtension on DateTime {
  /// Returns seconds since epoch
  int get secondsSinceEpoch => (millisecondsSinceEpoch / 1000).round();

  String get dayMonth => '$day/$month';
}
