class WorkersController < ApplicationController
  before_action :set_worker, only: %w[show edit update]

  def index
    @workers = Worker.all

    if params[:query].present?
      @workers = Worker.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @workers = Worker.all
    end
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)

    if @worker.valid?
      @worker.save!
      redirect_to @worker, notice: "Worker has been created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @worker.update(worker_params)

    if @worker.valid?
      @worker.save!
      redirect_to @worker, notice: "Worker has been updated successfully."
    else
      render :edit
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:email, :name, :alias, :mobile_number, :description, :photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived, cases_attributes: [:paid_proof, :files, :story])
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end
end
