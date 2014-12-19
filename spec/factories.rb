FactoryGirl.define do  factory :shipping do
    type ""
cost 1
  end
  factory :credit_card do
    name "MyString"
number "MyString"
expiration "MyString"
cvv "MyString"
  end
  factory :address do
    order_id 1
name "MyString"
street "MyString"
city "MyString"
state "MyString"
postal_code "MyString"
  end


  factory :line_item do
    product_id 1
    order_id 1
    total_cents 100
  end

  factory :order do
  end

  factory :product do
    name "Troll Doll"
    description "MyText"
    weight 1.5
    price_cents 100
  end
end
