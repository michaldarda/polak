class Tuple < Struct.new(:hash)
  def to_s
    "Tuple(#{hash})"
  end

  def inspect
    ">#{self}<"
  end
end
