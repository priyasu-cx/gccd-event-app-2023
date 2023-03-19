enum AccomodationEnum {
  travel('TO', 'Travel Only'),
  accomodation('AO', 'Accomodation Only'),
  both('TA', 'Travel and Accomodation Both'),
  none('NO', 'None');

  const AccomodationEnum(this.value, this.name);

  final String value, name;
}
