
module ArrayParameterVerifier
  def must_be_keys_in parameters
    self.each do | key |
      raise ArgumentError.new("#{key} is a required parameter") unless parameters.has_key? key
    end
  end

  def must_have_values_in parameters
    self.each do | key |
      raise ArgumentError.new("#{key} must have a value") if parameters[key].nil?
    end
  end
end

module HashParameterVerifier
  def must_have_keys_for *required_keys
    required_keys.must_be_keys_in self
  end

  def must_have_values_for *required_keys
    required_keys.must_have_values_in self
  end
end

Array.send :include, ArrayParameterVerifier
Hash.send :include, HashParameterVerifier