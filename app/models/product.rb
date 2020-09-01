class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_active_hash :condition
  has_one_active_hash :delivery_payer
  has_one_active_hash :region
  has_one_active_hash :delivery_span

  validates :name, :image, :value, :explain, :category_id,
            :condition_id, :delivery_payer_id, :region_id, :delivery_span_id, presence: true
  validates :category_id, :condition_id, :delivery_payer_id, :re numericality: {other_than: 1}

  belongs_to :user
  has_one :purchase
  has_many :comments
  has_many :favorites
end
