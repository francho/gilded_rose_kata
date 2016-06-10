require 'base_updater'

class ConjuredUpdater < BaseUpdater
  def self.is_updater_for(item)
    item.name.eql? 'Conjured Mana Cake'
  end

  def update_quality
    2.times do
      super
    end
  end
end
