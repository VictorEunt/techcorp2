class CorpusEntriesController < ApplicationController
  before_action :set_corpus_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, except: [:index, :show]
  
  respond_to :html
  def index
    @corpus_entries = CorpusEntry.all.page(params[:page])
      if params[:search]
        @corpus_entries = CorpusEntry.page(params[:page]).search(params[:search])
      else
        @corpus_entries = CorpusEntry.all
      end
  end

  def show
    @corpus_entries = CorpusEntry.paginate(:page => params[:page], :per_page => 15).order('genre DESC')
  end

  def new
    @corpus_entry = current_member.corpus_entries.build
  end

  def edit
  end

  def create
    @corpus_entry = current_member.corpus_entries.build(corpus_entry_params)
    if @corpus_entry.save
      redirect_to @corpus_entry, notice: "You successfully created the entry."
    else
      render :new
    end
  end

  def update
    if @corpus_entry.update(corpus_entry_params)
      redirect_to @corpus_entry, notice: 'You now have updated the entry.'
    else
      render :edit
    end
  end

  def destroy
    @corpus_entry.destroy
    respond_with(@corpus_entry)
  end

  private
    def set_corpus_entry
      @corpus_entry = CorpusEntry.find_by(id: params[:id])
    end

    def corpus_entry_params
      params.require(:corpus_entry).permit(:entry_number, :genre, :deliverable, :classification, :deadline, :format, :grade, :instructor, :student_level, :student_major, :student_gender, :student_age, :student_language, :student_ethnicity, :course_number, :course_section, :course_day, :course_time, :course_year, :document)
    end
    
end
