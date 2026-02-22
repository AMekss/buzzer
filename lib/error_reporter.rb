module ErrorReporter
  BACKTRACE_SIZE = 10

  def self.report(err, **context)
    err_message = "#{err.class.name}: #{err.message}"
    err_backtrace = err.backtrace.to_a[0...BACKTRACE_SIZE]

    Rails.logger.error({error: err_message, context: context, backtrace: err_backtrace}.compact_blank)
  end
end
