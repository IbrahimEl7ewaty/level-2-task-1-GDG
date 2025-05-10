class CreateAccountModel {
  final dynamic id;
  CreateAccountModel({required this.id});
  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(id: json['id']);
  }
}
