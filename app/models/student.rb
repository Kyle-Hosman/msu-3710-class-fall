class Student < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :school_email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@msudenver\.edu\z/i }
    validates :major, presence: true
    validates :graduation_date, presence: true
    validate :graduation_date_cannot_be_in_the_past

    def graduation_date_cannot_be_in_the_past
        if graduation_date.present? && graduation_date < Date.today
        errors.add(:graduation_date, "can't be in the past")
        end
    end

    has_one_attached :profile_picture

    VALID_MAJORS = ["Computer Engineering BS", "Computer Information Systems BS",
       "Computer Science BS", "Cybersecurity Major", "Data Science and Machine Learning Major"]

    validates :major, inclusion: { in: VALID_MAJORS, message: "%{value} is not a valid major" }

    GRAD_DATE_BEFOREAFTER = ["Before", "After"]
    VALID_GRAD_DATES = (Date.today..(Date.today + 10.years)).to_a

end
