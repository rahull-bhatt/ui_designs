
class Metadata {
  int? total;
  int? page;
  int? maxPage;

  Metadata({this.total, this.page, this.maxPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    maxPage = json['maxPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['maxPage'] = this.maxPage;
    return data;
  }
}