require 'base_updater'

class SulfurasUpdater < BaseUpdater
  def self.is_updater_for(item)
    item.name.eql? 'Sulfuras, Hand of Ragnaros'
  end

  def update_quality
    # Do nothing
  end

  def update_sell_in
    # Do nothing
  end
end
