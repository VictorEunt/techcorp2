class CorpusEntriesController < ApplicationController
  before_action :set_corpus_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, except: [:index, :show]
  
  respond_to :html
  def index
    @corpus_entries = CorpusEntry.all.page(params[:page]).order('id DESC')
    if params[:search_by_document_title]
      @corpus_entries = CorpusEntry.search_by_document_title(params[:search_by_document_title]).page(params[:page])
    elsif params[:search_by_genre]
      @corpus_entries = CorpusEntry.search_by_genre(params[:search_by_genre]).page(params[:page])
    elsif params[:search_by_classification]
      @corpus_entries = CorpusEntry.search_by_classification(params[:search_by_classification]).page(params[:page])
    elsif params[:search_by_student_level]
      @corpus_entries = CorpusEntry.search_by_student_level(params[:search_by_student_level]).page(params[:page])
    elsif params[:search_by_format]
      @corpus_entries = CorpusEntry.search_by_format(params[:search_by_format]).page(params[:page])
    else
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
      params.require(:corpus_entry).permit(:entry_number, :genre, :deliverable, :classification, :deadline, :format, :grade, :instructor, :student_level, :student_major, :student_gender, :student_age, :student_language, :student_ethnicity, :course_number, :course_section, :course_day, :course_time, :course_year, :document, :document_title, :search_by_document_title, :search_by_genre, :search_by_classification, :search_by_student_level, :search_by_format)
    end
    
end
