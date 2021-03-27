class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update]

  def index
    @workers = policy_scope(Worker).order(created_at: :desc)
  end

  def show
    authorize @worker
  end

  def new
    @worker = Worker.new
    authorize @worker
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.save
    redirect_to workers_path

    authorize @worker
  end

  def edit
    authorize @worker
  end

  def update
    @worker.update(worker_params)
    authorize @worker
    redirect_to worker_path
  end

  private

  # params use set?
  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived)
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end
end
