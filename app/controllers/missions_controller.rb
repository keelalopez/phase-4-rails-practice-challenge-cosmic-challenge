class MissionsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors

    def index
        missions = Mission.all
        render json: missions
    end

    def create
        mission = Mission.create!(params_mission)
        render json: mission
    end

    private

    # def render_not_found
    #     render json: {error: "Mission not found"}, status: :not_found
    # end

    def params_mission
        params.permit(:name, :scientist_id, :planet_id)
    end

    def render_validation_errors(invalid)
        render json: {errors: ErrorMessageSerializer.error_messages(invalid.record.errors)}, status: :unprocessable_entity
    end
end
