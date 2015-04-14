class MockFilter

  def initialize
    @filters = []
  end

  def restrict(filters)
    @filters = filters
    self
  end

  def ==(other)
    other.filters == self.filters
  end

  protected

  attr_reader :filters

end