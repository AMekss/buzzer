class Sources::Base < GraphQL::Dataloader::Source
  class << self
    SCALARS = [
      ::ActiveSupport::TimeWithZone,
      ::Date,
      ::DateTime,
      ::FalseClass,
      ::Float,
      ::Integer,
      ::NilClass,
      ::Range,
      ::String,
      ::Symbol,
      ::Time,
      ::TrueClass
    ].freeze

    # It is important to have it here, solves issues when we passing in
    # not "scalar" objects into data loader `.with(...)` method
    def batch_key_for(*batch_args, **batch_kwargs)
      normalize([*batch_args, **batch_kwargs]).compact
    end

    private

    def normalize(value)
      if Array === value
        value.flat_map { |v| normalize(v) }
      elsif Hash === value
        Array(value).flat_map { |v| normalize(v) }
      elsif ::GraphQL::Execution::Lookahead === value
        # Lookahead should not change the result set
        nil
      elsif ::ActiveRecord::Relation === value
        value.to_sql
      elsif ::Class === value
        value.name
      elsif value.respond_to?(:cache_key_with_version)
        value.cache_key_with_version
      elsif SCALARS.include?(value.class)
        value
      else
        raise ArgumentError, "don't know how to normalize #{value.inspect}"
      end
    end
  end
end
