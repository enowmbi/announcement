# frozen_string_literal: true

module Api
  module V1
    # Notification class
    class NotificationsController < ApplicationController
      before_action :set_notification, only: %i[show]

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
          render json: notification
        else
          render json: notification.errors.full_messages, status: 422
        end
      end

      def update
      end

      def destroy
      end

      private

      def set_notification
        @notification = Notification.find(params[:id])
      end

      def notification_params
        params.require(:notification).permit(:title, :start_date, :end_date, :system, :active)
      end
    end
  end
end
