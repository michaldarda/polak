# encoding: utf-8

class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "jezeli (#{condition}) to { #{consequence} } albo { #{alternative} }"
  end

  def inspect
    ">#{self}<"
  end
end
