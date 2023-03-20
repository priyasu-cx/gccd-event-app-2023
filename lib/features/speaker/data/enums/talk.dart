enum Talk {
  travel('short', 'Lightning Talk'),
  accomodation('medium', 'Regular Talk'),
  both('long', 'Long Talk');

  const Talk(this.value, this.name);

  final String value, name;
}
