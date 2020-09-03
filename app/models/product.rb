class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_payer
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_span

  has_one_attached :image

  validates :name, :image, :value, :explain, :category_id,
            :condition_id, :delivery_payer_id, :region_id, :delivery_span_id, presence: true
  validates :category_id, :condition_id, :delivery_payer_id, :region_id, :delivery_span_id, numericality: { other_than: 1 }
  validates :value, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  belongs_to :user
  has_one :purchase, dependent: :destroy
end
