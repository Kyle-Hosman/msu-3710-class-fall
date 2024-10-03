class Student < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :school_email, presence: true, uniqueness: true
    validates :major, presence: true
    validates :minor, presence: true
    validates :graduation_date, presence: true

    has_one_attached :profile_picture

    VALID_MAJORS = ["Computer Engineering BS", "Computer Information Systems BS",
       "Computer Science BS", "Cybersecurity Major", "Data Science and Machine Learning Major"]

    validates :major, inclusion: { in: VALID_MAJORS, message: "%{value} is not a valid major" }

end
