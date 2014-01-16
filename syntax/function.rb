# -*- encoding: utf-8 -*-

class Function < Struct.new(:formal, :body)
  def to_s
    "f(#{formal.join(",")}) { #{body} }"
  end

  def inspect
    ">#{self}<"
  end
end
