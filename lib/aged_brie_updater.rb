require 'base_updater'

class AgedBrieUpdater < BaseUpdater
  def self.is_updater_for(item)
    item.name.eql? 'Aged Brie'
  end

  def update_quality
    increase_quality_by_one
    increase_quality_by_one if @item.sell_in < 0
  end
end
