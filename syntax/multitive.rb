# encoding: utf-8

class Multitive < Struct.new(:operator, :left, :right)
  def to_s
    "#{left} #{operator} #{right}"
  end

  def inspect
    ">#{self}<"
  end
end
