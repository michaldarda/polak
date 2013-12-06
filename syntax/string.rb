class PString < Struct.new(:string)
  def to_s
    "#{string}"
  end

  def inspect
    ">#{self}<"
  end
end
