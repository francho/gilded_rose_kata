class ItemUpdater
  def self.update(item)
    if !aged_brie?(item) && !backstage?(item)
      if item.quality > 0
        unless sulfuras?(item)
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if backstage?(item)
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end
    unless sulfuras?(item)
      item.sell_in -= 1
    end
    if item.sell_in < 0
      unless aged_brie?item
        unless backstage?(item)
          if item.quality > 0
            unless sulfuras?(item)
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
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
end
