class Date
  def all_day
    self.beginning_of_day..self.end_of_day
  end
end