require 'base_updater'
require 'aged_brie_updater'
require 'backstage_updater'
require 'sulfuras_updater'

class ItemUpdater
  def self.for(item)
    return BackstageUpdater.new(item) if backstage? item
    return AgedBrieUpdater.new(item) if aged_brie? item
    return SulfurasUpdater.new(item) if sulfuras? item

    return BaseUpdater.new(item)
  end

  private
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
