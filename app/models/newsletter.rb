class Newsletter < ApplicationRecord
  validates :email, uniqueness: true
end
