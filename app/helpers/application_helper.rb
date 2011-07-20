module ApplicationHelper
  def create_url(string)
    # Autor: Martin Labuschin
    # Erstellt am 27. März 2008
    # Es werden alle Sonderzeichen aus dem String entfernt. Umlaute werden in AE, OE und UE etc., das ß in SS umgewandet. Alle Buchstaben werden in Minuskeln umgewandelt und alle Leerräume werden mit Minuszeichen gefüllt. Ein doppeltes Vorkommen, das Beginnen oder Beenden mit einem Minuszeichen wird verhindert.
    # BEMERKUNG: Es wird nur Plaintext erwartet
    callname = string.dup
    callname.downcase!
    callname.gsub!(/[^a-z0-9]+/i, '-')
    callname.gsub!(/(^[-]+|[-]+$)/, '')
    return callname
  end
end
