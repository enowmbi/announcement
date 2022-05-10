# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, with: :routing_error_handler
  rescue_from ActionController::ParameterMissing, with: :parameter_missing_handler
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_handler

  private

  def parameter_missing_handler
    render json: "The routes specified is missing a number of parameters", status: :unprocessable_entity
  end

  def routing_error_handler
    render json: "The route specified does not match any route in this app", status: :unprecessable_entity
  end
end
