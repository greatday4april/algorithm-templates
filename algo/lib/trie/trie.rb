class TrieNode
  attr_accessor :children, :word
  def initialize
    @children = {}
    @word = nil
  end
end

class Trie
  def initialize(words = [])
    @root = TrieNode.new
    words.each {|word| insert(word) }
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      node.children[char] = TrieNode.new unless node.children.has_key?(char)
      node = node.children[char]
    end
    node.word = word
  end

  def search(word)
    node = @root
    word.each_char do |char|
      return false unless node.children.has_key?(char)

      node = node.children[char]
    end
    !node.word.nil?
  end

  def starts_with(prefix)
    node = @root
    prefix.each_char do |char|
      return false unless node.children.has_key?(char)

      node = node.children[char]
    end
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  trie = Trie.new
  trie.insert('abc')
  p trie.starts_with('ab')
  p trie.search('ab')
  p trie.search('abc')


end
