class HomePagesController < PagesController
  def show
    @brush_strokes = BrushStroke.last(200)
  end
end
