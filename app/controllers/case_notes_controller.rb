class CaseNotesController < ApplicationController
  def new
    @case = Case.find(params[:case_id])
    @casenote = CaseNote.new
  end

  def create
    @casenote = CaseNote.new(review_params)
    @case = Case.find(params[:case_id])
    @casenote.case = @case
    if @casenote.save
      redirect_to case_path(@case)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:case_note).permit(:content)
  end
end
