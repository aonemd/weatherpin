class Post < ApplicationRecord
  enum unit: %w[celsius fahrenheit]

  belongs_to :user
end
