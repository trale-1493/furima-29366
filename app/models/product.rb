class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_payer
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_span

  has_one_attached :image, dependent: :destroy

  validates :name, :image, :value, :explain, :category_id,
            :condition_id, :delivery_payer_id, :region_id, :delivery_span_id, presence: true
  validates :category_id, :condition_id, :delivery_payer_id, :region_id, :delivery_span_id, numericality: { other_than: 1 }
  validates :value, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  belongs_to :user
  has_one :purchase, dependent: :destroy

  def self.search(word, category_id)
    if word
      products = Product.where('name LIKE(?)', "%#{word}%")
    else
      products = Product.all
    end

    if category_id && category_id != '1'
      products = products.where('category_id = ?', category_id)
    end
    
    return products
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end

  def prev
    Product.where("id < ?", self.id).order("id DESC").first    
  end

end
