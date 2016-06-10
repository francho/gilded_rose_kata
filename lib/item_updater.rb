require 'base_updater'
require 'aged_brie_updater'
require 'backstage_updater'
require 'sulfuras_updater'

class ItemUpdater
  def self.update(item)
    updater = if backstage? item
                BackstageUpdater.new(item)
              elsif aged_brie? item
                AgedBrieUpdater.new(item)
              elsif sulfuras? item
                SulfurasUpdater.new(item)
              else
                BaseUpdater.new(item)
              end

    updater.update_sell_in
    updater.update_quality
  end

  def self.aged_brie?(item)
    item.name.eql? 'Aged Brie'
  end

  def self.backstage?(item)
    item.name.eql? 'Backstage passes to a TAFKAL80ETC concert'
  end

  def self.sulfuras?(item)
    item.name.eql? 'Sulfuras, Hand of Ragnaros'
  end

end
