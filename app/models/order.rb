class Order < ApplicationRecord
  enum status: %i[pending paid canceled]
end
