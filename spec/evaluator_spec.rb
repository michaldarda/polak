require_relative 'spec_helper'
require_relative '../evaluator'

describe 'the evaluator operational semantics of Polak' do
  describe 'expressions' do
    describe 'a variable' do
      subject { Variable.new(:x) }
      let(:value) { double }
      let(:environment) { { x: value } }

      it { should evaluate_to(value).within(environment) }
    end

    describe 'a number' do
      subject(:itself) { Number.new(double) }

      it { should evaluate_to itself }
    end

    describe 'nil' do
      subject(:itself) { Nil.new }

      it { should evaluate_to itself }
    end

    describe 'list' do
      subject(:itself) { List.new(5, Nil.new) }

      it { should evaluate_to itself }
    end

    describe 'booleans' do
      describe 'true' do
        subject(:itself) { Boolean.new(true) }

        it { should evaluate_to itself }
      end

      describe 'false' do
        subject(:itself) { Boolean.new(false) }

        it { should evaluate_to itself }
      end
    end

    describe 'additiion' do
      context 'without reducible subexpressions' do
        subject { Additive.new(:+, Number.new(1), Number.new(2)) }

        it { should evaluate_to Number.new(3) }
      end

      context 'with a reducible subexpression' do
        context 'on the left' do
          subject { Additive.new(:+, Additive.new(:+, Number.new(1), Number.new(2)), Number.new(3)) }

          it { should evaluate_to Number.new(6) }
        end

        context 'on the right' do
          subject { Additive.new(:+, Number.new(1), Additive.new(:+, Number.new(2), Number.new(3))) }

          it { should evaluate_to Number.new(6) }
        end

        context 'on both sides' do
          subject { Additive.new(:+, Additive.new(:+, Number.new(1), Number.new(2)), Additive.new(:+, Number.new(3), Number.new(4))) }

          it { should evaluate_to Number.new(10) }
        end
      end
    end

    describe 'subtraction' do
      context 'without reducible subexpressions' do
        subject { Additive.new(:-, Number.new(8), Number.new(2)) }

        it { should evaluate_to Number.new(6) }
      end

      context 'with a reducible subexpression' do
        context 'on the left' do
          subject { Additive.new(:-, Additive.new(:-, Number.new(6), Number.new(3)), Number.new(3)) }

          it { should evaluate_to Number.new(0) }
        end

        context 'on the right' do
          subject { Additive.new(:-, Number.new(10), Additive.new(:-, Number.new(12), Number.new(3))) }

          it { should evaluate_to Number.new(1) }
        end

        context 'on both sides' do
          subject { Additive.new(:-, Additive.new(:-, Number.new(1), Number.new(2)), Additive.new(:-, Number.new(3), Number.new(4))) }

          it { should evaluate_to Number.new(0) }
        end
      end
    end

    describe 'multiplication' do
      context 'without reducible subexpressions' do
        subject { Multitive.new(:*, Number.new(2), Number.new(3)) }

        it { should evaluate_to Number.new(6) }
      end

      context 'with a reducible subexpression' do
        context 'on the left' do
          subject { Multitive.new(:*, Multitive.new(:*, Number.new(2), Number.new(3)), Number.new(4)) }

          it { should evaluate_to Number.new(24) }
        end

        context 'on the right' do
          subject { Multitive.new(:*, Number.new(2), Multitive.new(:*, Number.new(3), Number.new(4))) }

          it { should evaluate_to Number.new(24) }
        end

        context 'on both sides' do
          subject { Multitive.new(:*, Multitive.new(:*, Number.new(2), Number.new(3)), Multitive.new(:*, Number.new(4), Number.new(5))) }

          it { should evaluate_to Number.new(120) }
        end
      end
    end

    describe 'division' do
      context 'without reducible subexpressions' do
        subject { Multitive.new(:/, Number.new(2), Number.new(3)) }

        it { should evaluate_to Number.new(0) }
      end

      context 'with a reducible subexpression' do
        context 'on the left' do
          subject { Multitive.new(:/, Multitive.new(:/, Number.new(16), Number.new(8)), Number.new(2)) }

          it { should evaluate_to Number.new(1) }
        end

        context 'on the right' do
          subject { Multitive.new(:/, Number.new(18), Multitive.new(:/, Number.new(6), Number.new(3))) }

          it { should evaluate_to Number.new(9) }
        end

        context 'on both sides' do
          subject { Multitive.new(:/, Multitive.new(:/, Number.new(8), Number.new(2)), Multitive.new(:/, Number.new(4), Number.new(2))) }

          it { should evaluate_to Number.new(2) }
        end
      end
    end

    describe 'less than' do
      context 'without reducible subexpressions' do
        subject { Comparison.new(:<, Number.new(1), Number.new(2)) }

        it { should evaluate_to Boolean.new(true) }
      end

      context 'with a reducible subexpression' do
        context 'on the left' do
          subject { Comparison.new(:<, Additive.new(:+, Number.new(2), Number.new(3)), Number.new(4)) }

          it { should evaluate_to Boolean.new(false) }
        end

        context 'on the right' do
          subject { Comparison.new(:<, Number.new(1), Additive.new(:+, Number.new(2), Number.new(3))) }

          it { should evaluate_to Boolean.new(true) }
        end

        context 'on both sides' do
          subject { Comparison.new(:<, Additive.new(:+, Number.new(1), Number.new(5)), Multitive.new(:*, Number.new(2), Number.new(3))) }

          it { should evaluate_to Boolean.new(false) }
        end
      end
    end
  end

  describe 'statements' do
    describe 'do-nothing' do
      subject { DoNothing.new }
      let(:environment) { double }

      it { should evaluate_to(environment).within(environment) }
    end


    describe 'force assignment' do
      let(:environment) { { x: Number.new(1), y: Number.new(2) } }

      context 'without a reducible subexpression' do
        subject { ForceAssign.new(:x, Number.new(5)) }

        it { should evaluate_to(x: Number.new(5), y: Number.new(2)).within(environment) }
      end

      context 'with a reducible subexpression' do
        subject { ForceAssign.new(:x, Additive.new(:+, Number.new(2), Number.new(3))) }

        it { should evaluate_to(x: Number.new(5), y: Number.new(2)).within(environment) }
      end
    end

    describe 'sequence' do
      let(:environment) { { y: Number.new(3) } }

      context 'without reducible substatements' do
        subject { Sequence.new(DoNothing.new, DoNothing.new) }

        it { should evaluate_to(environment).within(environment) }
      end

      context 'with a reducible substatement' do
        context 'in first position' do
          subject { Sequence.new(Assign.new(:x, Number.new(1)), DoNothing.new) }

          it { should evaluate_to(x: Number.new(1), y: Number.new(3)).within(environment) }
        end

        context 'in second position' do
          subject { Sequence.new(DoNothing.new, Assign.new(:x, Number.new(2))) }

          it { should evaluate_to(x: Number.new(2), y: Number.new(3)).within(environment) }
        end

        context 'in both positions' do
          subject { Sequence.new(Assign.new(:x, Number.new(1)), ForceAssign.new(:x, Number.new(2))) }

          it { should evaluate_to(x: Number.new(2), y: Number.new(3)).within(environment) }
        end
      end
    end

    describe 'if' do
      let(:environment) { { x: Number.new(1), y: Number.new(2) } }

      context 'without a reducible subexpression' do
        subject { If.new(Boolean.new(false), Assign.new(:x, Number.new(3)), ForceAssign.new(:y, Number.new(3))) }

        it { should evaluate_to(x: Number.new(1), y: Number.new(3)).within(environment) }
      end

      context 'with a reducible subexpression' do
        subject { If.new(Comparison.new(:<, Number.new(3), Number.new(4)), ForceAssign.new(:x, Number.new(3)), ForceAssign.new(:y, Number.new(3))) }

        it { should evaluate_to(x: Number.new(3), y: Number.new(2)).within(environment) }
      end
    end

    describe 'function call' do
      let(:environment) { Assign.new("add", Function.new([], Number.new(5))).evaluate({})  }
      subject { FunctionCall.new("add", []) }

      it { should evaluate_to(Number.new(5)).within(environment) }
    end

    describe 'function call with one parameter' do
      let(:environment) { Assign.new("square", Function.new(["x"], Multitive.new(:*, Variable.new(:x), Variable.new(:x)))).evaluate({})  }
      subject { FunctionCall.new("square", [Number.new(2)]) }

      it { should evaluate_to(Number.new(4)).within(environment) }
    end

    describe 'recursive function call 1' do
      let(:environment) { Assign.new("factorial", Function.new(["n"], If.new(Comparison.new(:==, Variable.new(:n), Number.new(0)), Number.new(1), Multitive.new(:*, Variable.new(:n), FunctionCall.new("factorial", [Additive.new(:-, Variable.new(:n), 1)]))))).evaluate({})  }
      subject { FunctionCall.new("factorial", [Number.new(0)]) }

      it { should evaluate_to(Number.new(1)).within(environment) }
    end

    describe 'recursive function call 2' do
      let(:environment) { Assign.new("factorial", Function.new([:n], If.new(Comparison.new(:==, Variable.new(:n), Number.new(0)), Number.new(1), Multitive.new(:*, Variable.new(:n), FunctionCall.new("factorial", [Additive.new(:-, Variable.new(:n), Number.new(1))]))))).evaluate({})  }
      subject { FunctionCall.new("factorial", [Number.new(1)]) }

      it { should evaluate_to(Number.new(1)).within(environment) }
    end

    describe 'recursive function call 3' do
      let(:environment) { Assign.new("factorial", Function.new([:n], If.new(Comparison.new(:==, Variable.new(:n), Number.new(1)), Number.new(1), Multitive.new(:*, Variable.new(:n), FunctionCall.new("factorial", [Additive.new(:-, Variable.new(:n), Number.new(1))]))))).evaluate({})  }
      subject { FunctionCall.new("factorial", [Number.new(2)]) }

      it { should evaluate_to(Number.new(2)).within(environment) }
    end

    describe 'recursive function call 4' do
      let(:environment) do
        Assign.new("factorial",
                   Function.new([:n],
                                If.new(Comparison.new(:==, Variable.new(:n), Number.new(1)),
                                       Number.new(1),
                                       Multitive.new(:*, Variable.new(:n), FunctionCall.new("factorial", [Additive.new(:-, Variable.new(:n), Number.new(1))]))))).evaluate({})
      end
      subject { FunctionCall.new("factorial", [Number.new(3)]) }

      it { should evaluate_to(Number.new(6)).within(environment) }
    end

    describe 'recursive function call 5' do
      let(:environment) do
        Assign.new("silnia",
                   Function.new([:n],
                                If.new(Comparison.new(:==, Variable.new(:n), Number.new(1)),
                                       Number.new(1),
                                       Multitive.new(:*, Variable.new(:n), FunctionCall.new("silnia", [Additive.new(:-, Variable.new(:n), Number.new(1))]))))).evaluate({})
      end
      subject { FunctionCall.new("silnia", [Number.new(5)]) }

      it { should evaluate_to(Number.new(120)).within(environment) }
    end

    describe 'function as function arguments' do
      let(:environment) do
        Assign.new("nested",
                   Function.new([:f], FunctionCall.new(:f, []))).evaluate({})
      end
      subject { FunctionCall.new("nested", [Function.new([], Number.new(5))]) }

      it { should evaluate_to(Number.new(5)).within(environment) }
    end

    describe 'function returning closures' do
      let(:environment) do
        env = Assign.new("closure_fun", Function.new([],
                                    Function.new([],
                                      Number.new(5)))).evaluate({})

        Assign.new("returned_closure", FunctionCall.new("closure_fun", [])).evaluate(env)
      end

      subject { FunctionCall.new("returned_closure", []) }

      it { should evaluate_to(Number.new(5)).within(environment) }
    end
  end
end
