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
    if upload_verification_doc?
      case_id = Case.find(params[:worker][:case_id])
      redirect_to case_path(case_id)
    else
      redirect_to worker_path
    end
  end

  private

  # params use set?
  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived, cases_attributes: [:paid_proof, :files, :story])
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def upload_verification_doc?
    params[:commit] == "Save"
  end
end
