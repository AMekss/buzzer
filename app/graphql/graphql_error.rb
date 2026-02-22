class GraphqlError
  class DevelopmentMode < StandardError; end

  MAX_QUERY_SIZE = 500

  def self.build(*) = new(*).error

  def initialize(development_mode, err, obj, args, ctx, field)
    @ref = SecureRandom.uuid  # Connect FE errors with BE errors
    @development_mode = development_mode
    @err, @obj, @args, @ctx, @field = err, obj, args, ctx, field
  end

  def error
    ::ErrorReporter.report(err, **context)  # Report backend error

    return DevelopmentMode if development_mode

    # Return graphql-friendly error with reference to backend error
    ::GraphQL::ExecutionError.new(
      "Something went wrong",
      extensions: {error_code: "UNEXPECTED_ERROR", error_ref: ref}
    )
  end

  private

  attr_reader :ref, :development_mode, :err, :obj, :args, :ctx, :field

  def context
    {
      ref: ref,
      user_id: user_id,
      field: field&.name,
      object: object_details,
      query: safe_query_details
    }.compact
  end

  def user_id
    ctx[:current_user]&.id
  end

  def object_details
    return nil if obj.nil?

    {
      name: obj.class.name,
      id: obj.try(:id)
    }
  end

  # We don't control size of the query, so it's safer to put some limit to not overflow something
  # Note: lookahead is causing "stack level too deep" when serializing to JSON, so skip it
  def safe_query_details
    return nil if args.nil?

    args.except(:lookahead).to_json.truncate(MAX_QUERY_SIZE)
  end
end

