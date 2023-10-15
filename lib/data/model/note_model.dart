class NoteModel {
  String note;
  String date;

  NoteModel({required this.note, required this.date});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      note: json["note"] ?? "Empty note",
      date: json["date"] ?? "Empty date",
    );
  }

  toJson(){
    return {
      "note": note,
      "date": date
    };
  }
}
