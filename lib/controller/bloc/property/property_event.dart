abstract class PropertyEvent {}

class PropertyOwnershipChanged extends PropertyEvent {
  final String ownership; // "owned" or "leased"
  PropertyOwnershipChanged(this.ownership);
}

class PropertyRegistrationChanged extends PropertyEvent {
  final String registration; // "yes" or "no"
  PropertyRegistrationChanged(this.registration);
}

class RegistrationFilePicked extends PropertyEvent {
  final String filePath;

  RegistrationFilePicked(this.filePath);

}
