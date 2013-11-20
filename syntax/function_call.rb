# -*- encoding: utf-8 -*-

class FunctionCall < Struct.new(:name, :actual)
  def to_s
    actual_string = actual.join(",") rescue ""
    "#{name}(#{actual_string})"
  end

  def inspect
    ">#{self}<"
  end
end
