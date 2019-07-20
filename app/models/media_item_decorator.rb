MediaItem.class_eval do

  private

    def skip_for_non_images
      image? && !gif?
    end

end
