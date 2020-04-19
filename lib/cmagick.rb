# frozen_string_literal: true

require 'cmagick/version'
require 'rmagick'
require_relative './cmagick/rgb_to_ansi'

module CMagick
  #
  # cmagick = CMagick::LoadImage.new('/path/to/img.jpg')
  # cmagick.show
  #
  # if img is big size
  #
  # cmagick.resize(0.1).show
  #
  class LoadImage
    def initialize(img_path = '',
                   image: Magick::ImageList.new(img_path),
                   converter: RGBToANSI,
                   bg: "\x1b[48;5;")
      @img_path  = img_path
      @image     = image
      @converter = converter
      @bg        = bg
    end

    def show
      ansi_colors.each do |ansi_color|
        ansi_color.each do |code|
          print "#{color(code)}  "
        end
        puts
      end
      puts
    end

    def resize(scale = 1.0)
      if image_path == ''
        return LoadImage.new(image: @image.resize(scale),
                             converter: @converter,
                             bg: @bg)
      end

      LoadImage.new(@img_path,
                    image: @image.resize(scale),
                    converter: @converter,
                    bg: @bg)
    end

    def ansi_colors
      pixels_2d.map do |pixels|
        pixels.map { |r, g, b| @converter.call(r, g, b) }
      end
    end

    private

    def pixels
      @pixels ||=
        @image.export_pixels.map { |pix| pix / 257 }.each_slice(3).to_a
    end

    def pixels_2d
      @pixels_2d ||= pixels.each_slice(@image.columns)
    end

    def color(ansi_code)
      "#{@bg}#{ansi_code}m"
    end
  end
end
