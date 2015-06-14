module Api
  module V1
    class RapsController < ApplicationController

      api :GET, '/v1/raps', 'Beat のリストを取得する。'
      def index
        @raps = Rap.all
      end

      api :GET, '/v1/raps/:id', 'Rapを取得する。'
      def show
        @rap = Rap.find(params[:id])
      end

      api :POST, '/v1/beats/:beat_id/raps', 'Rapを作成する。'
      def create
        @rap = Rap.new(rap_params)
        beat = Beat.find(params[:beat_id])
        @rap.beat = beat

        if @rap.save
          render action: 'show', status: 200
        else
          render json: :nothing, status: 500
        end
      end

      api :PUT, '/v1/raps/:id', 'Rapを更新する。'
      def update
        @rap = Rap.find(params[:id])
        if @rap.update_attributes(rap_params)
          render action: 'show', status: 200
        else
          render json: :nothing, status: 500
        end
      end

      api :DELETE, '/v1/raps/:id', 'Rapを削除する。'
      def destroy
        @rap = Rap.find(params[:id])
        if @rap.destroy
          render json: :nothing, status: 200
        else
          render json: :nothing, status: 500
        end
      end

      private
      def rap_params
        params.require(:rap).permit(:title, :track)
      end
    end
  end
end
