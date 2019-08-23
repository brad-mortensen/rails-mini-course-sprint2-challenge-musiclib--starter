module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        @playlists = Playlist.where(:ser_id: params[:user_id])

        render json: @playlists
      end

      def show
        @playlist = Playlist.find(params[:id])

        render json: @playlist
      end

      def create
        @user = User.find(params[:user_id])
        @user_playlist = @user.playlists.build()
      end
    end
  end
end
