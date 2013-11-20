require_relative 'spec_helper'
require_relative '../parser'
require_relative '../syntax'

describe 'the Polak parser' do
  describe 'expressions' do
    describe 'numbers' do
      specify { '0'.should parse_as Number.new(0) }
      specify { '42'.should parse_as Number.new(42) }
    end

    describe 'booleans' do
      specify { 'true'.should parse_as Boolean.new(true) }
      specify { 'false'.should parse_as Boolean.new(false) }
    end

    describe 'variables' do
      specify { 'x'.should parse_as Variable.new(:x) }
      specify { 'y'.should parse_as Variable.new(:y) }
      specify { 'trueness'.should parse_as Variable.new(:trueness) }
      specify { 'falsehood'.should parse_as Variable.new(:falsehood) }
    end

    describe 'brackets' do
      specify { '(((42)))'.should parse_as Number.new(42) }
    end

    describe 'less than' do
      specify { 'x < 5'.should parse_as LessThan.new(Variable.new(:x), Number.new(5)) }
    end

    describe 'multiplication' do
      specify { '1 * 2'.should parse_as Multiply.new(Number.new(1), Number.new(2)) }
      specify { '1 * 2 * 3'.should parse_as Multiply.new(Number.new(1), Multiply.new(Number.new(2), Number.new(3))) }
      specify { '(1 * 2) * 3'.should parse_as Multiply.new(Multiply.new(Number.new(1), Number.new(2)), Number.new(3)) }
    end

    describe 'addition' do
      specify { '1 + 2'.should parse_as Add.new(Number.new(1), Number.new(2)) }
      specify { '1 + 2 + 3'.should parse_as Add.new(Number.new(1), Add.new(Number.new(2), Number.new(3))) }
      specify { '(1 + 2) + 3'.should parse_as Add.new(Add.new(Number.new(1), Number.new(2)), Number.new(3)) }
    end

    describe 'operator precedence' do
      specify { '1 + 2 < 3'.should parse_as LessThan.new(Add.new(Number.new(1), Number.new(2)), Number.new(3)) }
      specify { '1 + (2 < 3)'.should parse_as Add.new(Number.new(1), LessThan.new(Number.new(2), Number.new(3))) }
      specify { '1 < 2 + 3'.should parse_as LessThan.new(Number.new(1), Add.new(Number.new(2), Number.new(3))) }
      specify { '(1 < 2) + 3'.should parse_as Add.new(LessThan.new(Number.new(1), Number.new(2)), Number.new(3)) }
      specify { '1 + 2 * 3'.should parse_as Add.new(Number.new(1), Multiply.new(Number.new(2), Number.new(3))) }
      specify { '1 + 2 < 3 * 4'.should parse_as LessThan.new(Add.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4))) }
      specify { '(1 + 2) * 3'.should parse_as Multiply.new(Add.new(Number.new(1), Number.new(2)), Number.new(3)) }
      specify { '1 * 2 + 3'.should parse_as Add.new(Multiply.new(Number.new(1), Number.new(2)), Number.new(3)) }
      specify { '1 * (2 + 3)'.should parse_as Multiply.new(Number.new(1), Add.new(Number.new(2), Number.new(3))) }
    end
  end

  describe 'statements' do
    describe 'assignment' do
      specify { 'niech x = 42'.should parse_as Assign.new(:x, Number.new(42)) }
      specify { 'niech y = 6 * 7'.should parse_as Assign.new(:y, Multiply.new(Number.new(6), Number.new(7))) }
    end

    describe 'conditional' do
      specify { 'jezeli (x < 42) to { niech x = 6 } albo { niech x = 7 }'.should parse_as If.new(LessThan.new(Variable.new(:x), Number.new(42)), Assign.new(:x, Number.new(6)), Assign.new(:x, Number.new(7))) }
      specify { 'jezeli (true) to { niech x = 6 } albo { niech x = 7 }'.should parse_as If.new(Boolean.new(true), Assign.new(:x, Number.new(6)), Assign.new(:x, Number.new(7))) }
    end

    describe 'while' do
      specify { 'dopoki (x < 5) { niech x = x * 3 }'.should parse_as While.new(LessThan.new(Variable.new(:x), Number.new(5)), Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))) }
    end

    describe 'function' do
      specify { 'f() { niech x = 42 }'.should parse_as Function.new([], Assign.new(:x, Number.new(42))) }
    end

    describe 'function call' do
      specify { 'y()'.should parse_as FunctionCall.new(:y, []) }
    end

    describe 'doing nothing' do
      specify { '...'.should parse_as DoNothing.new }
    end

    describe 'sequence' do
      specify { '...; ...'.should parse_as Sequence.new(DoNothing.new(), DoNothing.new()) }
      specify { 'niech x = 6; niech y = 7; niech z = x * y'.should parse_as Sequence.new(Assign.new(:x, Number.new(6)), Sequence.new(Assign.new(:y, Number.new(7)), Assign.new(:z, Multiply.new(Variable.new(:x), Variable.new(:y))))) }
    end
  end
end
