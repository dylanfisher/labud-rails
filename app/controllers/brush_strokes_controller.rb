class BrushStrokesController < ForestController
  def create
    @brush_stroke = BrushStroke.new(brush_stroke_params)
    @brush_stroke.ip_address = request.remote_ip
    @brush_stroke.save

    head :ok
  end

  private

    def brush_stroke_params
      params.permit(:pos_x, :pos_y, :color, styles: {})
    end
end
