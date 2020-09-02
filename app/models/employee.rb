class Employee < ApplicationRecord
    belongs_to :company
    validates :name, presence: true
    validates :name, length: { minimum: 5 }


end
