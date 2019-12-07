FactoryBot.define do
  factory :product do
    category_id { 1 }
    name { "MyString" }
    caption { "MyText" }
    tex_excluded { 1 }
    product_image { "MyString" }
    sale_status { 1 }
  end
end
