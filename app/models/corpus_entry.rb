class CorpusEntry < ActiveRecord::Base
  belongs_to :member
  
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def self.search(search)
    where("entry_number LIKE ? OR genre LIKE ? OR deliverable LIKE ? OR classification LIKE ? OR deadline LIKE ? OR format LIKE ? OR grade LIKE ? OR instructor LIKE ? OR student_level LIKE ? OR student_major LIKE ? OR student_gender LIKE ? OR student_age LIKE ? OR student_language LIKE ? OR student_ethnicity LIKE ? OR course_number LIKE ? OR course_section LIKE ? OR course_day LIKE ? OR course_time LIKE ? OR course_year LIKE ?", "%#{search}%","%#{search}%","%#{search}%", "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
   end
  
end
