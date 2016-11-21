class AddDocumentTitleToCorpusEntries < ActiveRecord::Migration
  def change
    add_column :corpus_entries, :document_title, :string
  end
end
