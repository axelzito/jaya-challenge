module Api
  class EventsController < ApplicationController
    before_action :set_api_event, only: [:show, :update, :destroy]

    # GET /api/events
    def index
      @events = Event.all

      render json: @events
    end

    # GET /api/events/1
    def show
      render json: @event
    end

    # POST /api/events
    def create
      @event = Event.new(api_event_params)

      if @event.save
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/events/1
    def update
      if @event.update(api_event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/events/1
    def destroy
      @event.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_api_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_event_params
      params.fetch(:api_event, {})
    end
  end
end
