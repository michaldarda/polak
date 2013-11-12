# encoding: utf-8

class DoNothing
  def to_s
    'nic-nie-rob'
  end

  def inspect
    "«#{self}»"
  end

  def ==(other_statement)
    other_statement.instance_of?(DoNothing)
  end
end
