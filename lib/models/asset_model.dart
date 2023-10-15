class AssetModel {
  final int id;
  final int branchId;
  final int type;

  String get label => type == 1 ? 'Chair': 'Desc';

  AssetModel({
    required this.id,
    required this.branchId,
    required this.type,
  });

  factory AssetModel.fromJson(Map<String, dynamic> data) {
    return AssetModel(
      id: data['id'],
      branchId: data['branch_id'],
      type: data['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branch_id': branchId,
      'type': type,
    };
  }
}
