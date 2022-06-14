class DailYFramework {
  static const createdTime = 'createdTime';
}

class DailYFrames {
  late DateTime createdTime;
  late String title;
  late String description;
  late String id;
  late bool isDone;

  DailYFrames({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });
}
