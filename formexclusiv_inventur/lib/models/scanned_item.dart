class ScannedItem {
  ScannedItem(
      this.artNr, this.bezeichnung, this.anzahl, this.kategorie, this.preis);

  String artNr;
  String bezeichnung;
  String kategorie;
  double preis;
  int anzahl;
  double get anzahlGesamt => preis * anzahl;
}
