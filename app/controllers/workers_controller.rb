class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update]

  def index
    @workers = Worker.all
  end

  def show
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
  end

  def update
    @worker.update(worker_params)
    redirect_to worker_path
  end

  private

  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived)
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end
end
