# encoding: utf-8

class PModule < Struct.new(:name, :content)
  def to_s
    "moduł #{name} = { #{content} }"
  end

  def inspect
    ">#{self}<"
  end
end
