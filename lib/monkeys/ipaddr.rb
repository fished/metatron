class IPAddr
  def as_json(options={})
    return self.to_s
  end

  def cidr
    bit_count = @mask_addr.to_s(2).count("1")
    to_string + "/" + bit_count.to_s
  end
end
