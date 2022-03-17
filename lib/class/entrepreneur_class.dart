class EntrepreneurClass {
  EntrepreneurClass({
    this.status,
    this.approvedOn,
  });

  String? status;
  String? approvedOn;

  factory EntrepreneurClass.fromJson(Map<String, dynamic> json) =>
      EntrepreneurClass(
        status: json["status"],
        approvedOn: json["approved_on"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn,
      };
}
