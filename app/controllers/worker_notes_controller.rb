class WorkerNotesController < ApplicationController
  def new
    @worker = Worker.find(params[:worker_id])
    @workernote = WorkerNote.new
  end

  def create
    @workernote = WorkerNote.new(review_params)
    @worker = Worker.find(params[:worker_id])
    @workernote.worker = @worker
    if @workernote.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:worker_note).permit(:content)
  end
end
