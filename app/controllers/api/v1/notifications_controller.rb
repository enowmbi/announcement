module Api
  module V1
    class NotificationsController < ApplicationController
      def index
        @notifications = Notification.all
        render json: @notifications
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
