class Lookahead
  def initialize(root_lookahead)
    @root_lookahead = root_lookahead
  end

  def selects?(*field_names)
    lookaheads.any? { |lookahead| deep_match?(lookahead, field_names) }
  end

  private

  attr_reader :root_lookahead

  def deep_match?(lookahead, field_name)
    case field_name
    when Symbol
      lookahead.selects?(field_name)
    when Array
      field_name.any? { |val| deep_match?(lookahead, val) }
    when Hash
      field_name.any? { |key, val| deep_match?(lookahead.selection(key), val) }
    else
      false
    end
  end

  def lookaheads
    [
      # Base lookahead
      root_lookahead,
      # Selections made through `nodes { ... }`
      root_lookahead.selection(:nodes),
      # Selections made through `edges { node { ... } }`
      root_lookahead.selection(:edges).selection(:node)
    ]
  end
end
