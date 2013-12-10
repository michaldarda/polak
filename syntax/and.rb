# encoding: utf-8

class And < Struct.new(:left, :right)
  def to_s
    "#{left} i #{right}"
  end

  def inspect
    ">#{self}<"
  end
end
