json.array!(@corpus_entries) do |corpus_entry|
  json.extract! corpus_entry, :id, :entry_number, :genre, :deliverable, :classification, :deadline, :format, :grade, :instructor, :student_level, :student_major, :student_gender, :student_age, :student_language, :student_ethnicity, :course_number, :course_section, :course_day, :course_time, :course_year
  json.url corpus_entry_url(corpus_entry, format: :json)
end
