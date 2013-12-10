class List < Struct.new(:head, :tail)
  def to_s
    "Lista(#{head},#{tail})"
  end

  def inspect
    ">#{self}<"
  end
end
