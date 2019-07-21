class HomePagesController < PagesController
  def show
    @brush_strokes = BrushStroke.last(100)
  end
end
