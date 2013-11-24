class Equals < Struct.new(:left, :right)
  def to_s
    "#{left} = #{right}"
  end

  def inspect
    ">#{self}<"
  end
end
