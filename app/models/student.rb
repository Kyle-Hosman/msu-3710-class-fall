class Student < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :school_email, presence: true, uniqueness: true
    validates :major, presence: true
    validates :minor, presence: true
    validates :graduation_date, presence: true

    has_one_attached :profile_picture
end
