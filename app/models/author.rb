class Author < ApplicationRecord
  def name
    "#{first_name} #{last_name}"
  end

  validates :last_name, presence: true

  has_and_belongs_to_many :papers
end
