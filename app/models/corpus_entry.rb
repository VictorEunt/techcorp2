class CorpusEntry < ActiveRecord::Base
  belongs_to :member
  
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  include PgSearch
  pg_search_scope :search_by_whole_corpus, 
                  :against => [:entry_number, :genre, :deliverable, :classification, :deadline, :format, :grade, :instructor, :student_level, :student_major, :student_gender, :student_age, :student_language, :student_ethnicity, :course_number, :course_section, :course_day, :course_time, :course_year],
                  :order_within_rank => "corpus_entries.id DESC",
                  :using => {
                    :tsearch => {:prefix => true, :any_word => true}
                  }
    
  pg_search_scope :search_by_student_level, 
                  :against => [:student_level],
                  :using => {
                    :tsearch => {:any_word => true}
                  }

end
