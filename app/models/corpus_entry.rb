class CorpusEntry < ActiveRecord::Base
  belongs_to :member
  
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  include PgSearch
  pg_search_scope :search_by_document_title, 
                  :against => [:document_title],
                  :order_within_rank => "corpus_entries.id DESC",
                  :using => {
                    :tsearch => {:prefix => true, :any_word => true}
                  }
  
  pg_search_scope :search_by_genre, 
                  :against => [:genre],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
  
  pg_search_scope :search_by_classification, 
                  :against => [:classification],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
  
  pg_search_scope :search_by_student_level, 
                  :against => [:student_level],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
  
  pg_search_scope :search_by_format, 
                  :against => [:format],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
  


end
