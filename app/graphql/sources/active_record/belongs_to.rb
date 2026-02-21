class Sources::ActiveRecord::BelongsTo < Sources::Base
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def fetch(ids)
    records = model.where(id: ids).index_by(&:id)
    ids.map { |id| records.fetch(id, nil) }
  end
end
