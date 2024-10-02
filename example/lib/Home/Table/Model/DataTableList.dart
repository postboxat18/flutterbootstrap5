class DataTableList {
  String? regNo;
  String? patName;
  String? doctorname;
  String? age;
  String? sex;

  DataTableList(
      {this.regNo,
      this.patName,
      this.doctorname,
      this.age,
      this.sex,});

  DataTableList.fromJson(Map<String, dynamic> json) {
    regNo = json['RegNo'];
    patName = json['PatName'];
    doctorname = json['doctorname'];
    age = json['Age'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegNo'] = this.regNo;
    data['PatName'] = this.patName;
    data['doctorname'] = this.doctorname;
    data['Age'] = this.age;
    data['sex'] = this.sex;
    return data;
  }

  dynamic get(String key) {
    var map = toJson();
    if (map.containsKey(key)) {
      return map[key];
    }
  }
}
