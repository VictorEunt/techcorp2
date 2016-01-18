#lib/tasks/import.rake
require 'csv'    

namespace :import_csv do
  task :create_entries => :environment do
    CSV.foreach("lib/assets/corpus.csv", :headers => true) do |row|
      CorpusEntry.create!(row.to_hash)
    end
  end
end
