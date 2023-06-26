class MembershipsController < ApplicationController

  # go over this with ben today
  def create
    # member_already_exists = Membership.find_by(params[:client_id])
    # if member_already_exists.gym_id == params[:gym_id]
    #   render json: { message: "Client may only have 1 membership to this gym" }, status: :unprocessable_entity
    # else # gym_id not found
    membership = Membership.create!(membership_params)
    render json: membership, status: :created

    # end
  end

  private

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end
end
