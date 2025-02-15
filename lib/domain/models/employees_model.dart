class EmployeesModel {
  int? _id;
  String? _name;
  String? _job;
  String? _admissionDate;
  String? _phone;
  String? _image;

  EmployeesModel(
      {int? id,
      String? name,
      String? job,
      String? admissionDate,
      String? phone,
      String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (job != null) {
      this._job = job;
    }
    if (admissionDate != null) {
      this._admissionDate = admissionDate;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (image != null) {
      this._image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get job => _job;
  set job(String? job) => _job = job;
  String? get admissionDate => _admissionDate;
  set admissionDate(String? admissionDate) => _admissionDate = admissionDate;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get image => _image;
  set image(String? image) => _image = image;

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _job = json['job'];
    _admissionDate = json['admission_date'];
    _phone = json['phone'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['job'] = this._job;
    data['admission_date'] = this._admissionDate;
    data['phone'] = this._phone;
    data['image'] = this._image;
    return data;
  }
}
