require 'base_updater'
require 'aged_brie_updater'
require 'backstage_updater'
require 'sulfuras_updater'
require 'conjured_updater'

class ItemUpdater
  def self.for(item)
    BackstageUpdater.for(item) ||
      AgedBrieUpdater.for(item) ||
      SulfurasUpdater.for(item) ||
      ConjuredUpdater.for(item) ||
      BaseUpdater.for(item)
  end

end
