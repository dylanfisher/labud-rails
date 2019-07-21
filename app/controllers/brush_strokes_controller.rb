class BrushStrokesController < ForestController
  def create
    @brush_stroke = BrushStroke.new(brush_stroke_params)

    @brush_stroke.color = session[:color]
    @brush_stroke.ip_address = request.remote_ip

    authorize @brush_stroke

    @brush_stroke.save
  end

  private

    def brush_stroke_params
      params.permit(:pos_x, :pos_y)
    end
end
