require 'test_helper'

class CorpusEntriesControllerTest < ActionController::TestCase
  setup do
    @corpus_entry = corpus_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corpus_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corpus_entry" do
    assert_difference('CorpusEntry.count') do
      post :create, corpus_entry: { classification: @corpus_entry.classification, course_day: @corpus_entry.course_day, course_number: @corpus_entry.course_number, course_section: @corpus_entry.course_section, course_time: @corpus_entry.course_time, course_year: @corpus_entry.course_year, deadline: @corpus_entry.deadline, deliverable: @corpus_entry.deliverable, entry_number: @corpus_entry.entry_number, format: @corpus_entry.format, genre: @corpus_entry.genre, grade: @corpus_entry.grade, instructor: @corpus_entry.instructor, student_age: @corpus_entry.student_age, student_ethnicity: @corpus_entry.student_ethnicity, student_gender: @corpus_entry.student_gender, student_language: @corpus_entry.student_language, student_level: @corpus_entry.student_level, student_major: @corpus_entry.student_major }
    end

    assert_redirected_to corpus_entry_path(assigns(:corpus_entry))
  end

  test "should show corpus_entry" do
    get :show, id: @corpus_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corpus_entry
    assert_response :success
  end

  test "should update corpus_entry" do
    patch :update, id: @corpus_entry, corpus_entry: { classification: @corpus_entry.classification, course_day: @corpus_entry.course_day, course_number: @corpus_entry.course_number, course_section: @corpus_entry.course_section, course_time: @corpus_entry.course_time, course_year: @corpus_entry.course_year, deadline: @corpus_entry.deadline, deliverable: @corpus_entry.deliverable, entry_number: @corpus_entry.entry_number, format: @corpus_entry.format, genre: @corpus_entry.genre, grade: @corpus_entry.grade, instructor: @corpus_entry.instructor, student_age: @corpus_entry.student_age, student_ethnicity: @corpus_entry.student_ethnicity, student_gender: @corpus_entry.student_gender, student_language: @corpus_entry.student_language, student_level: @corpus_entry.student_level, student_major: @corpus_entry.student_major }
    assert_redirected_to corpus_entry_path(assigns(:corpus_entry))
  end

  test "should destroy corpus_entry" do
    assert_difference('CorpusEntry.count', -1) do
      delete :destroy, id: @corpus_entry
    end

    assert_redirected_to corpus_entries_path
  end
end
