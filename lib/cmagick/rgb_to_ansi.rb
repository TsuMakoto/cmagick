# frozen_string_literal: true

module CMagick
  # c = ColorContol.new

  # r = 'ff'.hex
  # g = 'e7'.hex
  # b = 'f4'.hex
  # c.call(r: r, g: g, b: b)
  # => 224
  #
  # r = 'ff'.hex
  # g = 'ff'.hex
  # b = 'ff'.hex
  # c.call(r: r, g: g, b: b)
  # => 231
  #
  # r = '00'.hex
  # g = '00'.hex
  # b = '00'.hex
  # c.call(r: r, g: g, b: b)
  # => 16
  # rubocop:disable Naming/UncommunicativeMethodParamName
  class RGBToANSI
    class << self
      def call(r, g, b)
        ansi(r, g, b)
      end

      private

      def ansi(r, g, b)
        (r * 5 / 255 * 36) + (g * 5 / 255 * 6) + (b * 5 / 255) + 16
      end
    end
  end
  # rubocop:enable Naming/UncommunicativeMethodParamName
end
