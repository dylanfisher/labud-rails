class Admin::BrushStrokesController < Admin::ForestController
  before_action :set_brush_stroke, only: [:show, :edit, :update, :destroy]

  def index
    @brush_strokes = apply_scopes(BrushStroke).by_id.page(params[:page])
  end

  def show
    authorize @brush_stroke
  end

  def new
    @brush_stroke = BrushStroke.new
    authorize @brush_stroke
  end

  def edit
    authorize @brush_stroke
  end

  def create
    @brush_stroke = BrushStroke.new(brush_stroke_params)
    authorize @brush_stroke

    if @brush_stroke.save
      redirect_to edit_admin_brush_stroke_path(@brush_stroke), notice: 'BrushStroke was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @brush_stroke

    if @brush_stroke.update(brush_stroke_params)
      redirect_to edit_admin_brush_stroke_path(@brush_stroke), notice: 'BrushStroke was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @brush_stroke
    @brush_stroke.destroy
    redirect_to admin_brush_strokes_url, notice: 'BrushStroke was successfully destroyed.'
  end

  private

    def brush_stroke_params
      # Add blockable params to the permitted attributes if this record is blockable `**BlockSlot.blockable_params`
      params.require(:brush_stroke).permit(:pos_x, :pos_y, :color, :ip_address)
    end

    def set_brush_stroke
      @brush_stroke = BrushStroke.find(params[:id])
    end
end
