class CorpusEntry < ActiveRecord::Base
  belongs_to :member
  
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/pdf"]
end
