class Post < ApplicationRecord
  enum unit: %w[celsius fahrenheit]

  belongs_to :user

  validates_presence_of :temperature, message: 'temperature cannot be blank'
end
