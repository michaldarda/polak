# encoding: utf-8

class Assign < Struct.new(:name, :expression)
  def to_s
    "niech #{name} = #{expression}"
  end

  def inspect
    "«#{self}»"
  end
end
