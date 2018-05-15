class Fun < ApplicationRecord
    belongs_to :post, counter_cache: :funs_count
    belongs_to :user
end
