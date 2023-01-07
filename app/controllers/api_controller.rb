class ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token
  
    rescue_from StandardError, with: :handle_api_error
  
    def handle_api_error(e)
      case e
      when ActionController::ParameterMissing
        return render json: { message: param_missing_message(e.message) || 'Invalid Params' },
                      status: :bad_request
      when  JWT::ExpiredSignature
        return render json: { message: 'Token has expired'}, status: :unauthorized
      when JWT::DecodeError
        return render json: { message: 'Token is invalid'}, status: :unauthorized
      else
        return render json: { message: 'Internal server error' }, status: :internal_server_error
      end
    end
  
    def param_missing_message(message)
      if message.match?(/empty: password/)
        'Password is missing'
      elsif message.match?(/empty: email/)
        'Email is missing'
      elsif message.match?(/empty: first_name/)
        'First name is missing'
      elsif message.match?(/empty: last_name/)
        'Last name is missing'
      elsif message.match?(/empty: status/)
        'Status is missing'
      elsif message.match?(/empty: name/)
        'Name is missing'
      end
    end
end