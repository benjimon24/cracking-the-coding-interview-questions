class Node
  attr_reader :next, :data
  def initialize(data)
    @next = nil
    @data = data
  end

  def append(node)
    @next = node
  end
end

class LinkedList
  def initialize(node)
    @head = node
  end

end
