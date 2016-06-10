class ItemUpdater
  def self.update(item)
    update_sell_in item
    update_quality item
  end

  def self.update_quality(item)
    if backstage? item
      increase_quality item
      increase_quality item if item.sell_in < 10
      increase_quality item if item.sell_in < 5
      item.quality = 0 if item.sell_in < 0
    elsif aged_brie? item
      increase_quality item
      increase_quality item if item.sell_in < 0
    elsif sulfuras? item
    else
      decrease_quality item
      decrease_quality item if item.sell_in < 0
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
