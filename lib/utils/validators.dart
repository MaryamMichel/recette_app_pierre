import 'dart:ui';

extension RecipeValidators on String {
  bool get isValidTitle {
    return trim().length >= 3;
  }

  bool get isNoEmptyText {
    return trim().isNotEmpty;
  }

  bool get isValidDuration {
    if (isEmpty) return false;
    final parsed = int.tryParse(trim());
    return parsed != null && parsed > 0;
  }

}