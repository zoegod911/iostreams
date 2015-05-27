module RocketJob
  module Streams
    class GzipWriter
      # Write to a file / stream, compressing with GZip
      def self.open(file_name_or_io, &block)
        if file_name_or_io.is_a?(String)
          Zlib::GzipWriter.open(file_name_or_io, &block)
        else
          begin
            io = Zlib::GzipWriter.new(file_name_or_io)
            block.call(io)
          ensure
            io.close if io
          end
        end
      end

    end
  end
end