# implement a set that respects insertion order


class OrderedSet
  def initialize
    @hash = {}
  end

  def add(element)
    @hash[element] = element
  end

  def delete(element)
    @hash.delete(element)
  end

  def include?(element)
    @hash.key?(element)
  end

  def shift()
    @hash.shift.first
  end

  def first()
    @hash.first.first
  end

  def to_a
    @hash.keys
  end
end