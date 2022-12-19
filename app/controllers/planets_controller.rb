class PlanetsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        planets = Planet.all
        render json: planets, status: :ok
    end

    private

    # def render_not_found
    #     render json: {error: "Planet not found"}, status: :not_found
    # end
end
