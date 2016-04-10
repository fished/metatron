class Network < ActiveRecord::Base
  has_many :addresses
  has_many :nodes, through: :addresses
  belongs_to :parent, :class_name => :Network
  has_many :children, :class_name => :Network, :foreign_key => :parent_id

  # Address
  validates :address, uniqueness: true
  def address
    address=read_attribute(:address)
    if address.nil?
      ""
    else
      read_attribute(:address).cidr
    end
  end

  def address=(a)
    if a.is_a?(String)
      write_attribute(:address, IPAddr.new(a))
    else
      write_attribute(:address, a)
    end
  end

  # Reparent networks and addresses when a new network is created
  after_create do
    Address.where(["address << inet ?", self.address]).map(&:set_network!)
    Network.reparent!
  end

  # children
  before_destroy do
    if children.count > 0
      errors.add_to_base("cannot delete network while it has children")
    end
  end

  # parent
  before_validation :set_parent
  def set_parent
    self.parent=Network.find_parents(self.address).limit(1).first
  end

  def set_parent!
    self.set_parent
    self.save!
  end

  def Network.reparent!
    Network.all.map(&:set_parent!)
  end


  # Return a list of all parents
  def parents
    if self.address.nil? || self.address == ""
      []
    else
      Network.find_parents(self.address).all
    end
  end

  # Return a query for all parents of the specified address by IP.
  def Network.find_parents(addr)
    Network.where(["address >> inet ?", addr]).
      order("masklen(address) DESC")
  end
end
