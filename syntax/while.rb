# encoding: utf-8

class While < Struct.new(:condition, :body)
  def to_s
    "dopoki (#{condition}) { #{body} }"
  end

  def inspect
    ">#{self}<"
  end
end
