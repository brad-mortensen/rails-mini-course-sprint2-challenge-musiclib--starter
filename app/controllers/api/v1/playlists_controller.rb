module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        @playlists = User.find(params[:artist_id]).playlists

        render json: @playlists
      end

      def show
        @playlist = Playlist.find(params[:id])

        render json: @playlist
      end

      def create
        @user = User.find(params[:user_id])
        @user_playlist = @user.playlists.build(playlist_params)

        if @user_playlist.save
          render json: @playlist, status: :created, location: api_v1_playlist_url(@playlist)
        else
          render json: @playlist.errors, status: :unprocessable_entity
        end
      end

      private

      def playlist_params
        params.require(:playlist).permit(:name)
      end
    end
  end
end
