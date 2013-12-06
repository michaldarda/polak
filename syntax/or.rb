# encoding: utf-8

class Or < Struct.new(:left, :right)
  def to_s
    "#{left} lub #{right}"
  end

  def inspect
    ">#{self}<"
  end
end
