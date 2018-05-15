class Scare < ApplicationRecord
  belongs_to :post, counter_cache: :scares_count
  belongs_to :user
end
