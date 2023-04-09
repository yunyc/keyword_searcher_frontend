enum VbEnabled { TRUE, FALSE }

extension VbEnabledExtension on VbEnabled {
  String get description {
    switch (this) {
      case VbEnabled.TRUE:
        return '진동';
      case VbEnabled.FALSE:
        return '진동없음';
    }
  }

  bool get value {
    switch (this) {
      case VbEnabled.TRUE:
        return true;
      case VbEnabled.FALSE:
        return false;
    }
  }

  static getValueByDescription(String description) {
    switch (description) {
      case '진동':
        return VbEnabled.TRUE.value;
      case '진동없음':
        return VbEnabled.FALSE.value;
    }
  }

  static getDescriptionByValue(bool value) {
    switch (value) {
      case true:
        return VbEnabled.TRUE.description;
      case false:
        return VbEnabled.FALSE.description;
    }
  }
}