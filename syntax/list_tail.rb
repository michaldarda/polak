class ListTail < Struct.new(:list)
  def to_s
    "#{list.tail}"
  end

  def inspect
    ">#{self}<"
  end
end
