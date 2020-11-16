class Product < ApplicationRecord
    has_one_attached :image, dependent: :purge
    #The below lines of code validate the entry of data and attempt to prevent intrusive data entry
    validates :name, :image, presence: true
    validates :name, uniqueness: true
    validates :price, numericality: {greater_than_or_equal_to: 10}
end
