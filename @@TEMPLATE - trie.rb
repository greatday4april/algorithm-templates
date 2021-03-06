class Trie
  attr_accessor :word, :children
  def initialize(words=[])
    @children = {}
    @word = nil
    words.each {|word| self.insert(word)}
  end

  def insert(word)
    node = self
    word.each_char do |char|
      node.children[char] = Trie.new if !node.children.key?(char)
      node = node.children[char]
    end
    node.word = word
  end

  def search(word)
    node = self.find_node(word)
    return !node.nil? && node.word == word
  end

  def starts_with(prefix)
    return !self.find_node(prefix).nil?
  end

  protected
  def find_node(word)
    node = self
    word.each_char do |char|
      return nil if !node.children.key?(char)
      node = node.children[char]
    end
    return node
  end
end

if __FILE__ == $PROGRAM_NAME
  trie = Trie.new
  trie.insert('abc')
  p trie.starts_with('ab')
  p trie.search('ab')
  p trie.search('abc')
end