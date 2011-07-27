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
    callname
  end

  def remove_images_and_videos(html)
    return '' if !html || html.blank?
    # clean media content out
    s = html # This sanitize helper will html encode all tags and strip all attributes that aren’t
    s.gsub!(%r{<youtube>.*?</youtube>}im, '') # remove VIDEO
    s.gsub!(%r{<imagen>.*?</imagen>}im, '') # remove IMAGEN
    s.gsub!(%r{<img[^>]*>}i, '') # remove IMG
    s
  end

  def prepare_for_summary(html)
    s = remove_images_and_videos(html)
    s.strip! # delete leading and trailing whitespace
    s.gsub!(/\s+/, ' ') # collapse chunks of whitespace into single spaces
    s
  end

  def html_to_plain_text(html)
    return '' if !html || html.blank?
    tk = HTML::Tokenizer.new(html)
    text = ''
    while token = tk.next
      text += token if !HTML::Node.parse(nil, 0, 0, token, false).is_a?(HTML::Tag)
    end
    text
  end

  def get_summary(content, limit = 640)
    new_content = remove_images_and_videos(content)[0..(limit-3)].concat(' ...')
    new_content.html_safe
  end

end
