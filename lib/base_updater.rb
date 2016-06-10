class BaseUpdater
  def initialize(item)
    @item = item
  end

  def update_quality
    decrease_quality_by_one
    decrease_quality_by_one if @item.sell_in < 0
  end


  protected

  def decrease_quality_by_one
    return unless @item.quality > 0
    @item.quality -= 1
  end

end
