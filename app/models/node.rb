class Node < ActiveRecord::Base
  #tags
  has_and_belongs_to_many :tags

  #Addresses
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses,
    allow_destroy: true,
    reject_if: :all_blank

  #Hostname
  validates :hostname, uniqueness: true

  #Network
  has_many :networks, through: :addresses

  #props
  after_initialize do
    self.props = {}
  end

  #properties
  has_many :properties, dependent: :destroy
  accepts_nested_attributes_for :properties,
    allow_destroy: true,
    reject_if: :all_blank
end
