class List < Struct.new(:head, :tail)
  def to_s
    "List(#{head},#{tail})"
  end

  def inspect
    ">#{self}<"
  end
end
