module CartHelper

  def convert_to_dollars(cents)
    "%.2f"%(cents.to_f / 100)
  end
end
