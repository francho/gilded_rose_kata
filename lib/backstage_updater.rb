require 'base_updater'

class BackstageUpdater < BaseUpdater
  def self.is_updater_for(item)
    item.name.eql? 'Backstage passes to a TAFKAL80ETC concert'
  end

  def update_quality
    increase_quality_by_one
    increase_quality_by_one if @item.sell_in < 10
    increase_quality_by_one if @item.sell_in < 5
    @item.quality = 0 if @item.sell_in < 0
  end
end
