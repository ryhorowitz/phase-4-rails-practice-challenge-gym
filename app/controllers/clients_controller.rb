class ClientsController < ApplicationController
  def show
    client = Client.find(params[:id])

    render json: client, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: "Record Not Found" }, status: :not_found
  end

  private

  def find_memberships
    Membership.find_by(params[:id])
  end
end
