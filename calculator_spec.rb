# Implement a calculator DSL that supports following functions:
#  calculate do 
#   add 2
#   subtract 3
#   multiply 4
#   divide 5
#  end

require './calculator'

describe Calculator do
   def calculate(&block)
    subject.calculate(&block)
  end

  describe "Addition operation" do
    it "returns correct values for positive numbers" do
      expect(
        calculate do
          add 2
          add 2                    
        end  
      ).to eq(4)
    end
 
    it "returns correct values for negative numbers" do
      expect(
        calculate do
          add -2
          add -2
        end  
      ).to eq(-4)
    end
 
    it "returns correct values for positive and negative numbers" do
      expect(
        calculate do
          add 2
          add 10
          add -10                    
        end  
      ).to eq(2)
    end
  end
 
  describe "Subtraction operation" do
    it "returns correct values for subtraction" do
    expect(
      calculate do
        subtract 2
        subtract 3
        subtract 5
      end
      ).to eq(-10)
  end
end
 
  describe "Division operation" do
    it "returns correct values for division" do
      expect(
        calculate do
          add 50
          divide 2
          divide 5
        end
        ).to eq(5)
    end

    it "should raise divide by zero error" do
        expect(
        calculate do
          add 5
          divide 0
        end
        ).to raise_error(ZeroDivisionError)
    end
  end
 
  describe "Multiplication operation" do
    it "returns correct values for multiplication" do
      expect(
        calculate do
          add 5
          multiply 2
          multiply 10
        end
        ).to eq(100)
    end
  end
 
  describe "Mixed operations" do
    it "returns correct values when mixing all operations" do
      expect(
        calculate do
          add 2
          add -2
          subtract -2
          multiply 10
          divide 10                    
        end  
      ).to eq(2)
    end
  end
end