class PlaybookIdEncoder
  INDEXER = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z _]
  def self.encode(string)
    string.to_s.split('').map do |char|
      index = INDEXER.index(char)
      if index < 10
        "0#{index}"
      else
        index
      end
    end.join('')
  end

  def self.decode(encoded)
    encoded = "0#{encoded}" if encoded.to_s.length.odd?

    encoded.to_s.scan(/../).map do |index|
      INDEXER[index.to_i]
    end.join('')
  end
end
