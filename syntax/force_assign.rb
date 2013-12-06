# encoding: utf-8

class ForceAssign < Struct.new(:name, :expression)
  def to_s
    "niech! #{name} = #{expression}"
  end

  def inspect
    ">#{self}<"
  end
end
