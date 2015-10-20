class AddAttachmentDocumentToCorpusEntries < ActiveRecord::Migration
  def self.up
    change_table :corpus_entries do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :corpus_entries, :document
  end
end
