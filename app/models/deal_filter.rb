class DealFilter

  def initialize(relation)
    @relation = relation
  end

  def restrict(restrictions)
    on_date!(restrictions.try(:[], :date))

    # @relation
  end

  private

  def on_date!(date)
    begin
      filter_date = Chronic.parse('next ' + date)
    rescue ArgumentError, TypeError
      filter_date = Date.current
    end
    Deal.occurring_on(filter_date)
  end

  def where(*a)
    @relation = @relation.where(*a)
  end

end