require 'base_updater'
require 'aged_brie_updater'
require 'backstage_updater'
require 'sulfuras_updater'

class ItemUpdater
  def self.update(item)
    update_sell_in item
    update_quality item
  end

  def self.update_quality(item)
    if backstage? item
      updater = BackstageUpdater.new(item)
      updater.update_quality
    elsif aged_brie? item
      updater = AgedBrieUpdater.new(item)
      updater.update_quality
    elsif sulfuras? item
      updater = SulfurasUpdater.new(item)
      updater.update_quality
    else
      updater = BaseUpdater.new(item)
      updater.update_quality
    end
  end

  def self.update_sell_in(item)
    return if sulfuras?(item)
    item.sell_in -= 1
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

  def self.decrease_quality(item)
    return unless item.quality > 0
    item.quality -= 1
  end

  def self.increase_quality(item)
    return unless item.quality < 50
    item.quality += 1
  end
end
