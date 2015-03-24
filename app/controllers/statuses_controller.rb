class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update]

  def show
  end

  def update
    @status.update! status_params
    render :show, status: :ok, location: @status
  end

  private

  def set_status
    @status = Status.all.first
  end

  def status_params
    params.permit :text
  end
end
