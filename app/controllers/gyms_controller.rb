class GymsController < ApplicationController
  resuce_from ActiveRecord::RecordNotFound, with: :render_gym_not_found

  def show
    gym = find_gym
    render json: gym, status: :ok
  end

  def destroy #delete associated memberships as well.
    # find all memberships where gym_id = params[:id]
    Membership.where(gym_id: params[:id]).destroy_all
    gym = find_gym
    gym.destroy

    head :no_content
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def render_gym_not_found
    render json: { error: "Gym not found" }, status: :not_found
  end
end
