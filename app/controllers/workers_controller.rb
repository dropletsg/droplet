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
    redirect_to workers_path
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.update(worker_params)
    redirect_to workers_path
  end

  private

  # params use set?
  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :id_type, :id_valid, :payment_link, :is_archived)
  end
end
