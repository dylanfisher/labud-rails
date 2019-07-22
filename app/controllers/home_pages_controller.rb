class HomePagesController < PagesController
  def show
    @brush_strokes = BrushStroke.recent.limit(100).reverse
    @bg_color = BrushStroke::BG_COLORS.sample

    last_color_index = Rails.cache.fetch('last_color_index') { -1 }.to_i

    if Rails.env.development?
      @color = BrushStroke::COLORS.sample
    elsif last_color_index.present?
      new_color_index = last_color_index += 1

      if new_color_index >= BrushStroke::COLORS.length || new_color_index < 0
        new_color_index = 0
      end

      @color = BrushStroke::COLORS[new_color_index]

      Rails.cache.write('last_color_index', new_color_index)
    else
      @color = BrushStroke::COLORS.sample
    end
  end
end
