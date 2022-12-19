class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    def create
        signups = Signup.create(signup_params)
        if signups.valid?
        render json: signups, status: :created
    end

    private

    def signup_params
        params.permit(:time)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

end
