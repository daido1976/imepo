class Worst < ApplicationRecord
  belongs_to :post, counter_cache: :worsts_count
  belongs_to :user
end
