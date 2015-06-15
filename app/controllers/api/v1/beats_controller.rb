module Api
  module V1
    class BeatsController < ApplicationController
      api :GET, '/v1/beats', 'Beat のリストを取得する。'
      example <<-EOS
      [
        {"beat":{"id":26,"title":"beat2","created_at":"2015-06-14T15:43:27.492Z","track":{"url":"/system/beats/tracks/000/000/026/original/remix_asadanousan.mp3?1434296607","size":5452943}}},
        {"beat":{"id":27,"title":"beat3","created_at":"2015-06-14T15:43:27.816Z","track":{"url":"/system/beats/tracks/000/000/027/original/urban_dope_shit.mp3?1434296607","size":6355269}}}
      ]
      EOS

      def index
        @beats = Beat.includes(:raps).all
      end

      api :GET, '/v1/beats/:id', 'Beatを取得する。'
      param :id, String, desc: 'The Beat id', required: true
      example <<-EOS
      {
        "beat":{
          "id":26,
          "title":"beat2",
          "created_at":"2015-06-14T15:43:27.492Z",
          "track": {
            "url":"/system/beats/tracks/000/000/026/original/remix_asadanousan.mp3?1434296607",
            "size":5452943
          }
        }
      }
      EOS
      def show
        @beat = Beat.find(params[:id])
      end

      api :POST, '/v1/beats', 'Beatを作成する。'
      description <<-EOS
        Request Header:
          Content-Type: multipart/form-data
      EOS
      param :beat, Hash, required: true do
        param :title, String, desc: 'The Beat title', required: true
        param :track, String, desc: 'base64-encoded track file content', required: true
      end

      def create
        @beat = Beat.new(beat_params)
        if @beat.save
          render action: 'show', status: 200
        else
          render json: :nothing, status: 400
        end
      end

      api :PUT, '/v1/beats/:id', 'Beatを更新する。'
      param :id, String, desc: 'The Beat id', required: true
      param :beat, Hash do
        param :title, String, desc: 'The Beat title'
      end
      def update
        @beat = Beat.find(params[:id])
        if @beat.update_attributes(beat_params)
          render action: 'show', status: 200
        else
          render json: :nothing, status: 400
        end
      end

      api :DELETE, '/v1/beats/:id', 'Beatを削除する。'
      param :id, String, desc: 'The Beat id', required: true
      def destroy
        @beat = Beat.find(params[:id])
        if @beat.destroy
          render json: :nothing, status: 200
        else
          render json: :nothing, status: 400
        end
      end

      private
      def beat_params
        params.require(:beat).permit(:title, :track)
      end
    end
  end
end
