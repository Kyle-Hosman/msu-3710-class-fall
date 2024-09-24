require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # Test that a valid student is saved
  test "should save student with valid attributes" do
    student = Student.new(
      first_name: "John", 
      last_name: "Doe", 
      school_email: "john.doe2@msud.edu", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
  end

  # Test email format validation with valid email
  test "should save student with a valid msudenver email" do
    student = Student.new(
      first_name: "John", 
      last_name: "Doe", 
      school_email: "john.doe3@msudenver.edu", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
  end

  # Test presence validation for last_name
  test "should not save student without a last name" do
    student = Student.new(
      first_name: "John", 
      school_email: "john.doe@msudenver.edu", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
    assert_not student.save, "Saved the student without a last name"
  end

  # Test presence validation for email
  test "should not save student without an email" do
    student = Student.new(
      first_name: "John", 
      last_name: "Doe", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
    assert_not student.save, "Saved the student without an email"
  end

  # Test email format validation for msudenver email
  test "should not save student with an invalid email" do
    student = Student.new(
      first_name: "John", 
      last_name: "Doe", 
      school_email: "john.doe@gmail.com", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
    assert_not student.save, "Saved the student with a non-msudenver email"
  end

  test "should not save student with first name too short" do
    student = Student.new(
      first_name: "J",  # Too short
      last_name: "Doe", 
      school_email: "john.doe_min_length@msudenver.edu", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
    assert_not student.save, "Saved the student with a first name too short"
  end

  test "should not save student with a graduation date in the past" do
    student = Student.new(
      first_name: "John", 
      last_name: "Doe", 
      school_email: "john.doe_future_test@msudenver.edu", 
      major: "Computer Science", 
      graduation_date: "2020-05-20"  # A date in the past
    )
    assert_not student.save, "Saved the student with a graduation date in the past"
  end

  test "should not save student with last name too short" do
    student = Student.new(
      first_name: "John", 
      last_name: "D",  # Too short
      school_email: "john.doe_lastname_min_length@msudenver.edu", 
      major: "Computer Science", 
      graduation_date: "2025-05-20"
    )
    assert_not student.save, "Saved the student with a last name too short"
  end


end
