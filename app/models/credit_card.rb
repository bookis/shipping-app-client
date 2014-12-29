class CreditCard < ActiveRecord::Base
  belongs_to :order
end
