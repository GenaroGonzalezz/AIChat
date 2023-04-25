class ModelsModel {
  final String id;
  final String root;
  final int created;
  final String model;
  // final List<Choices> choices;
  // final Usage usage;

  ModelsModel(
      {required this.id,
      required this.root,
      required this.created,
      required this.model});

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
        id: json['id'],
        root: json['root'],
        created: json['created'],
        model: json['model'],
      );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
