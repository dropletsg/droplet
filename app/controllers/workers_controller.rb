class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.save
    # how to redirect to home page?
  end

  # When updating an existing worker, the worker gets duplicated in the index page so there is now the original plus updated worker
  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.new(worker_params)
    @worker.save
    # how to redirect to home page?
  end

  private

  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived)
  end
end
