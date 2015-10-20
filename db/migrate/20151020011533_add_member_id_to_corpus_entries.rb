class AddMemberIdToCorpusEntries < ActiveRecord::Migration
  def change
    add_column :corpus_entries, :member_id, :integer
    add_index :corpus_entries, :member_id
  end
end
