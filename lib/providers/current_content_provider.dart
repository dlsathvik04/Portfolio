import 'package:flutter/widgets.dart';

enum Content {
  about,
  projects,
  connect,
}

class CurrentContentProvider with ChangeNotifier {
  Content _currentContent = Content.about;

  Content get currentContent {
    return _currentContent;
  }

  void setCurrentContent(Content newContent) {
    _currentContent = newContent;
    notifyListeners();
  }

  String getCurrentContentValue() {
    if (_currentContent == Content.about) {
      return "About content";
    } else if (_currentContent == Content.projects) {
      return "Projects content";
    } else {
      return "Connect content";
    }
  }
}
