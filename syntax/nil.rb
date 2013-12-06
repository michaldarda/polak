# encoding: utf-8

class Nil
  def to_s
    "nic"
  end

  def inspect
    ">#{self}<"
  end
end
