class Api::V1::EventsController < ApplicationController
    before_action :set_event, only: [:show, :update, :destroy]
    
    before_action :authenticate_user!

    def index
        @events = Event.all
        render json: @events   
    end

    def show
        render json: @event
    end

    def create
        @event = Event.new(event_params)

        if @event.save
            render json: @event, status: :created
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end

    def update
        if @event.update(event_params)
            render json: @event
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @event.destroy
    end

    
    private
        def set_event
            @event = Event.find(params[:id])
        end
        
        def event_params
            params.permit(:title, :desc).merge(user_id: current_user.id)
        end 

end
