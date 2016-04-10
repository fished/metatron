class Address < ActiveRecord::Base
  belongs_to :node
  belongs_to :network

  # network_id
  before_save :set_network
  def set_network
    self.network=Network.find_parents(self.address.to_s).limit(1).first
  end

  def set_network!
    set_network
    save
  end
end
