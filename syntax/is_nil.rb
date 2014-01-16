class IsNil < Struct.new(:value)
  def to_s
    "Lista.koniec?"
  end

  def inspect
    ">#{self}<"
  end
end
