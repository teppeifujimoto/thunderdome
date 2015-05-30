module Api
  module V1
    class BeatsController < ApplicationController
      def index
        @beats = Beat.all

        render 'api/beats/index'
      end

      def show
        @beat = Beat.find(params[:id])
        render 'api/beats/show'
      end

      def create
        @beat = Beat.new(beat_params)
        if @beat.save
          render :nothing, status: 200
        end
      end

      private
      def beat_params
        params.require(:beat).permit(:title)
      end
    end
  end
end
