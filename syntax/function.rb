# -*- encoding: utf-8 -*-

class Function < Struct.new(:formal, :body)
  def to_s
    "f() { #{body} }"
  end

  def inspect
    "«#{self}»"
  end
end
