class GraphqlUserError
  ErrorDetail = Struct.new(:code, :message)

  GENERIC_ERROR_DETAIL = ErrorDetail.new("GENERIC_ERROR", "Generic error")
  HANDLED_ERROR_DETAILS = {
    not_authorized: ErrorDetail.new("NOT_AUTHORIZED", "Not authorized"),
    record_not_found: ErrorDetail.new("RECORD_NOT_FOUND", "Record not found"),
    record_invalid: ErrorDetail.new("RECORD_INVALID", "Record can not be saved")
  }

  def self.build(code, context = {})
    error_detail = HANDLED_ERROR_DETAILS.fetch(code, GENERIC_ERROR_DETAIL)
    ::GraphQL::ExecutionError.new(error_detail.message, extensions: {err_code: error_detail.code}.merge(context))
  end

  def self.maybe(err)
    case err
    when ActiveRecord::RecordNotFound
      build(:record_not_found, {model: err&.model})
    when ActiveRecord::RecordInvalid
      build(:record_invalid, {errors: err&.record.errors.full_messages})
    else
      err
    end
  end
end
