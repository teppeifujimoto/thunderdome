module Api
  module V1
    class BeatsController < ApplicationController
      api :GET, '/v1/beats', 'Beat のリストを取得する。'
      def index
        @beats = Beat.all
      end

      api :GET, '/v1/beats/:id', 'Beatを取得する。'
      error :code => 404, :desc => "Not Found"
      formats ['json']
      def show
        @beat = Beat.find(params[:id])
      end

      api :POST, '/v1/beats', 'Beatを作成する。'
      def create
        @beat = Beat.new(beat_params)
        if @beat.save
          render action: 'show', status: 200
        else
          render json: :nothing, status: 500
        end
      end

      api :PUT, '/v1/beats/:id', 'Beatを更新する。'
      error :code => 404, :desc => "Not Found"
      def update
        @beat = Beat.find(params[:id])
        if @beat.update_attributes(beat_params)
          render action: 'show', status: 200
        else
          render json: :nothing, status: 500
        end
      end

      api :DELETE, '/v1/beats/:id', 'Beatを削除する。'
      def destroy
        @beat = Beat.find(params[:id])
        if @beat.destroy
          render json: :nothing, status: 200
        else
          render json: :nothing, status: 500
        end
      end

      private
      def beat_params
        params.require(:beat).permit(:title, :track)
      end
    end
  end
end
