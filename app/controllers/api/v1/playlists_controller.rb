module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        @playlists = User.find(params[:user_id]).playlists.all()

        render json: @playlists
      end

      def show
        @playlist = Playlist.find(params[:id])

        render json: @playlist
      end

      def create
        
      end

      private

      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end
