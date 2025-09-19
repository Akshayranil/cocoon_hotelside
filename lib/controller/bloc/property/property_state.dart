class PropertyState {
  final String ownership; // "owned" or "leased"
  final String registration; // "yes" or "no"
  final String? filePath;

  PropertyState({this.ownership = "", this.registration = "",this.filePath});

  PropertyState copyWith({String? ownership, String? registration,String? filePath}) {
    return PropertyState(
      ownership: ownership ?? this.ownership,
      registration: registration ?? this.registration,
      filePath: filePath??this.filePath
    );
  }
}
