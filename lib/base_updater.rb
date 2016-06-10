class BaseUpdater
  def initialize(item)
    @item = item
  end

  def update
    update_sell_in
    update_quality
  end

  def self.for(item)
    new item if is_updater_for item
  end

  def self.is_updater_for(item)
    true
  end

  protected

  def update_quality
    decrease_quality_by_one
    decrease_quality_by_one if @item.sell_in < 0
  end

  def update_sell_in
    @item.sell_in -= 1
  end

  def decrease_quality_by_one
    return unless @item.quality > 0
    @item.quality -= 1
  end


  def increase_quality_by_one
    return unless @item.quality < 50
    @item.quality += 1
  end

end
