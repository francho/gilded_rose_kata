require 'base_updater'

class ConjuredUpdater < BaseUpdater
  def update_quality
    2.times do
      super
    end
  end
end
