class WorkerNotesController < ApplicationController
  def new
    @worker = Worker.find(params[:worker_id])
    @worker_note = WorkerNote.new
  end

  def create
    @worker_note = WorkerNote.new(worker_note_params)
    @worker = Worker.find(params[:worker_id])
    @worker_note.worker = @worker

    if @worker_note.valid?
      @worker_note.save!
      redirect_to @worker, notice: "Note has been created successfully."
    else
      render :new
    end
  end

  private

  def worker_note_params
    params.require(:worker_note).permit(:content)
  end
end
