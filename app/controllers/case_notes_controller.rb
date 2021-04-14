class CaseNotesController < ApplicationController
  def new
    @case = Case.find(params[:case_id])
    @case_note = CaseNote.new
  end

  def create
    @case_note = CaseNote.new(case_note_params)
    @case = Case.find(params[:case_id])
    @case_note.case = @case

    if @case_note.valid?
      @case_note.save!
      redirect_to @case, notice: "Note has been created successfully."
    else
      render :new
    end
  end

  private

  def case_note_params
    params.require(:case_note).permit(:content)
  end
end
