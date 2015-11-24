require 'bigdecimal'
require 'qtrix/matrix/common'

module Qtrix
  class Matrix

    class Model
      attr_reader :rows
      def initialize(rows)
        @rows = rows
      end

      def to_table
        @rows.map{|row| row.entries.map(&:queue)}
      end

      def row_count
        @rows.length
      end
    end

    ##
    # An entry (or cell) in the matrix, contains a single queue and its value
    # relative to the other entries to the left in the same row.
    Entry = Struct.new(:queue, :resource_percentage, :value) do
      def to_s
        "#{queue}(#{value},#{resource_percentage})"
      end
    end

    ##
    # A row in the matrix, contains the hostname the row is for and the entries
    # of queues within the row.
    Row = Struct.new(:hostname, :entries) do
      def to_s
        "#{hostname}: #{entries.join(', ')}"
      end
    end
  end
end
