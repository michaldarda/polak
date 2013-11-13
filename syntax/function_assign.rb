# -*- encoding: utf-8 -*-

class FunctionAssign < Struct.new(:name, :function)
  def to_s
    "def #{name} = #{function}"
  end

  def inspect
    "«#{self}»"
  end
end
