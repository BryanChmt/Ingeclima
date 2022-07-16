
class CheckBoxState {
  String title;
  bool value;
  int id;

  CheckBoxState({
    this.title,
    this.value = false,
    this.id,
  });

  @override
  String toString() {
    return title;
  }


  // factory CheckBoxState.fromJson(Map<String, dynamic> json) => CheckBoxState(
  //       id: json["Id"],
  //       value: json["Value"],
  //       title: json["Title"],
  //     );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Value": value,
        "Title": title,
      };
}
