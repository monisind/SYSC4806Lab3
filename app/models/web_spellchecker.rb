class WebSpellchecker < Spellchecker

  #constructor
  def initialize()

  end
  
  #return subset of the input words that are known by this database
  def known(words)
    known_words = DictionaryWord.select("word, count").where(word: words).order(count: :desc)
    return known_words.map{|x| x[:word]}

  end

end 
