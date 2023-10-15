class UserModel {
  final int id;
  final int branchId;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.branchId,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      branchId: data['branch_id'],
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branch_id': branchId,
      'name': name,
      'email': email,
    };
  }
}
