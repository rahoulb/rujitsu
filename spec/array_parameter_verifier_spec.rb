require "lib/array_parameter_verifier"

describe "parameter verification" do

  describe "when given an array of valid keys" do
    it "should be happy if all given keys are present within the parameters" do
      [:field1, :field2].must_be_keys_in({ :field1 => :value1, :field2 => :value2 }).should be_true
    end
    it "should raise an argument error if any one of the given keys is not present within the parameters" do
      lambda { 
        [:field1, :field2].must_be_keys_in({ :field1 => :value1 })
      }.should raise_error(ArgumentError)
    end

    it "should be happy if all given keys have values within the parameters" do
      [:field1, :field2].must_have_values_in({ :field1 => :value1, :field2 => :value2 })
    end
    it "should raise an argument error if any one of the given keys has no value within the parameters" do
      lambda { 
        [:field1, :field2].must_have_values_in({ :field1 => :value1, :field2 => nil })
      }.should raise_error(ArgumentError)
    end
  end

  describe "when given a Hash of parameters" do
    it "should be happy if all given keys are present within the parameters" do
      { :field1 => :value1, :field2 => :value2 }.must_have_keys_for(:field1, :field2).should be_true
    end
    it "should raise an argument error if any one of the given keys is not present within the parameters" do
      lambda { 
        { :field1 => :value1 }.must_have_keys_for(:field1, :field2)
      }.should raise_error(ArgumentError)
    end

    it "should be happy if all given keys have values within the parameters" do
      { :field1 => :value1, :field2 => :value2 }.must_have_values_for(:field1, :field2).should be_true
    end
    it "should raise an argument error if any one of the given keys has no value within the parameters" do
      lambda { 
        { :field1 => :value1, :field2 => nil }.must_have_values_for(:field1, :field2)
      }.should raise_error(ArgumentError)
    end

  end 

end