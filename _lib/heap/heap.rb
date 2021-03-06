require 'json'

class Heap
  # Implement a Heap using an array
  def initialize(elements=[], &compare_block)
    # Initialize arr with nil as first element
    # This dummy element makes it where first real element is at index 1
    # You can now divide i / 2 to find an element's parent
    # Elements' children are at i * 2 && (i * 2) + 1
    @compare_block = compare_block
    non_leaf_end_idx = (elements.length / 2).to_i
    @elements = [nil] + elements
    (1..non_leaf_end_idx).reverse_each do |idx|
      bubble_down(idx)
    end
  end

  def push(element)
    self << element
  end

  def <<(element)
    # push item onto end (bottom) of heap
    @elements.push(element)
    # then bubble it up until it's in the right spot
    bubble_up(@elements.length - 1)
  end

  def pop
    # swap the first and last elements
    @elements[1], @elements[@elements.length - 1] = @elements[@elements.length - 1], @elements[1]
    # Min element is now at end of arr (bottom of heap)
    top = @elements.pop
    # Now bubble the top element (previously the bottom element) down until it's in the correct spot
    bubble_down(1)
    # return the min element
    top
  end

  def top
    @elements[1]
  end

  def inspect
    "Heap: #{JSON.generate(@elements[1..-1])}"
  end

  def to_a
    @elements[1..-1]
  end

  def size
    @elements.size - 1
  end

  def empty?
    self.size == 0
  end

  def to_a
    @elements[1..-1]
  end

  private

  def bubble_up(index)
    parent_i = index / 2
    # Done if you reach top element or parent is already larger than child
    return if index <= 1 || @compare_block.call(@elements[parent_i], @elements[index])

    # Otherwise, swap parent & child, then continue bubbling
    @elements[parent_i], @elements[index] = @elements[index], @elements[parent_i]

    bubble_up(parent_i)
  end

  def bubble_down(index)
    child_i = index * 2
    return if child_i > size

    # get largest child
    not_last = child_i < size
    left = @elements[child_i]
    right = @elements[child_i + 1]
    child_i += 1 if not_last && @compare_block.call(right, left)

    # stop if parent element is already larger than children
    return if @compare_block.call(@elements[index], @elements[child_i])

    # otherwise, swap and continue
    @elements[index], @elements[child_i] = @elements[child_i], @elements[index]
    bubble_down(child_i)
  end
end

class MaxHeap < Heap
  def initialize(elements=[])
    super(elements) {|ele_a, ele_b| (ele_a <=> ele_b) >= 0}
  end
end

class MinHeap < Heap
  def initialize(elements=[])
    super(elements) {|ele_a, ele_b| (ele_a <=> ele_b) <= 0}
  end
end

if __FILE__ == $PROGRAM_NAME
  p MaxHeap.new([2, 3, 100, 56, 12, 24])
  p MinHeap.new([2, 3, 100, 56, 12, 24])
end
