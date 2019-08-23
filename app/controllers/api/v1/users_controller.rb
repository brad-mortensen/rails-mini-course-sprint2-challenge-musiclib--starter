module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = User.all

        render json: @users
      end

      def show
        @playlist = Playlist.find(params[:id])

        render json: @playlist
      end

      def create
      end
    end
  end
end
