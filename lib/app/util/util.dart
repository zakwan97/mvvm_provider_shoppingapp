extension JsonParsing on dynamic {
  String toJson() => jsonEncode(this);
  Map<String, dynamic> fromJson() =>
      jsonDecode(toString()) as Map<String, dynamic>;
}
