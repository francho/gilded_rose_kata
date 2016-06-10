class ItemUpdater
  def self.update(item)
    unless aged_brie?(item) || backstage?(item)
      unless sulfuras?(item)
        decrease_quality item
      end
    else
      increase_quality item
      if backstage?(item)
        if item.sell_in < 11
          increase_quality item
        end
        if item.sell_in < 6
          increase_quality item
        end
      end
    end
    unless sulfuras?(item)
      item.sell_in -= 1
    end
    if item.sell_in < 0
      unless aged_brie? item
        item.quality = 0 if backstage?(item)

        unless sulfuras?(item)
          decrease_quality item
        end

      else
        increase_quality item
      end
    end

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
