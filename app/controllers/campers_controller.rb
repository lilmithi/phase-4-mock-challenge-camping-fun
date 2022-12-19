class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        campers = Camper.all
        render json: campers, include: :signups, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, include: :activities, status: :ok
    end

    def create
        camper = Camper.create!(campers_params)
        render json: camper, status: :created
    end

    private

    def campers_params
        params.permit(:name, :age)
    end
    
    def find_camper
        Camper.find_by(id: params[:id])
    end

    def render_response_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
