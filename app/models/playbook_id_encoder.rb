class PlaybookIdEncoder
  INDEXER = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z _]
  def self.encode(string)
    string.to_s.split('').map do |char|
      INDEXER.index(char)
    end.inject(:+)
  end
end
