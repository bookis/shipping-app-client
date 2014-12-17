class Product < ActiveRecord::Base
  has_many :items, class_name: "LineItem"
  validates :name, :price_cents, :weight, presence: true
  validates :price_cents, :weight, numericality: {greater_than: 0}
  before_create :set_canonical_name
  monetize :price_cents

  mount_uploader :image, ProductImageUploader

  def to_param
    self.canonical_name
  end

  private

  def set_canonical_name
    self.canonical_name = self.name.parameterize
  end

end
