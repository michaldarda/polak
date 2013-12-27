class ListHead < Struct.new(:list)
  def to_s
    "#{list.head}"
  end

  def inspect
    ">#{self}<"
  end
end
