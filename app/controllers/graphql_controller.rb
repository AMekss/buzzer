class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  rescue_from ::GraphqlError::DevelopmentMode, with: :render_development_error

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user
    }
    result = BuzzerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  # IRL would be set from the auth token
  def current_user
    @current_user ||= Participant.find_by!(full_name: "Bob")
  end

  def render_development_error(error)
    original_error = error.cause || error

    render json: {errors: [{message: original_error.message, backtrace: original_error.backtrace}], data: {}}, status: 500
  end

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end
end
