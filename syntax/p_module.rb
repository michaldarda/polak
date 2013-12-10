# encoding: utf-8

class PModule < Struct.new(:content)
  def to_s
    "modul { #{content} }"
  end

  def inspect
    ">#{self}<"
  end
end
