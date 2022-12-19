class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index
        activities = Activity.all
        render json: activities, include: :signups ,status: :ok
    end

    def destroy
        activity = find_activity
        activity.destroy
        render json: {}, status: :no_content
    end

    private

    def activities_params
        params.permit(:name, :difficulty)
    end

    def find_activity
        Activity.find_by(id: params[:id])
    end

    def render_response_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

end
