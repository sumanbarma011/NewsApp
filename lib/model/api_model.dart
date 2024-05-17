class ApiModel {
  ApiModel(
    this.id,
    this.userid,
    this.title,
  );
  int? userid;
  int? id;
  String? title;
  ApiModel.fromJson(Map<String, dynamic> e) {
    id = e['id'];
    userid = e['userid'];
    title = e['title'];
  }
}
