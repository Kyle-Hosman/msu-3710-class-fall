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
end
