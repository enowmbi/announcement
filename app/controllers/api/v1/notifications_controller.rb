# frozen_string_literal: true

module Api
  module V1
    # Notification class
    class NotificationsController < ApplicationController
      before_action :set_notification, only: %i[show update destroy]

      def index
        @notifications = Notification.all
        render json: @notifications
      end

      def show
        render json: @notification
      end

      def create
        notification = Notification.new(notification_params)
        if notification.save
          NotificationService.new.call

          render json: notification
        else
          render json: notification.errors.full_messages, status: 422
        end
      end

      def update
        if @notification.update(notification_params)
          render json: @notification
        else
          render json: @notification.errors.full_messages, status: unprocessable_entity
        end
      end

      def destroy
        if @notification.destroy
          head :no_content
        else
          render @notification.errors.full_messages, status: :unprocessable_entity
        end
      end

      def search
        search_results = NotificationQuery.new(params).call
        render json: search_results
      end

      private

      def set_notification
        @notification = Notification.find(params[:id])
      end

      def notification_params
        params.require(:notification).permit(:title, :start_date, :end_date, :system, :active)
      end

      def record_not_found_handler
        render json: "The notification with id: #{params[:id]} not found", status: :unprocessable_entity
      end
    end
  end
end
