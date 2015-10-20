class CreateCorpusEntries < ActiveRecord::Migration
  def change
    create_table :corpus_entries do |t|
      t.string :entry_number
      t.string :genre
      t.string :deliverable
      t.string :classification
      t.string :deadline
      t.string :format
      t.string :grade
      t.string :instructor
      t.string :student_level
      t.string :student_major
      t.string :student_gender
      t.string :student_age
      t.string :student_language
      t.string :student_ethnicity
      t.string :course_number
      t.string :course_section
      t.string :course_day
      t.string :course_time
      t.integer :course_year

      t.timestamps
    end
  end
end
