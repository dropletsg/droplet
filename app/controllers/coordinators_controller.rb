class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: [:show, :edit, :update]
  
  def index
    if params[:query].present?
      @coordinators = Coordinator.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @coordinators = Coordinator.all
    end
  end

  def show
  end
  
  def new
    @coordinator = Coordinator.new
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)
    if @coordinator.save
      redirect_to coordinator_path(@coordinator)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @coordinator.update(coordinator_params)
    if @coordinator.save
      redirect_to coordinator_path(@coordinator)
    else
      render :new
    end
  end

  private

  def set_coordinator
    @coordinator = Coordinator.find(params[:id])
  end

  def coordinator_params
    params.require(:coordinator).permit(:name, :email, :mobile_number, :description, :profile_photo, :telegram_handle, :is_archived)
  end

end
