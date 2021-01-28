# frozen_string_literal: true

require 'date'

module StrictTodo
  class Checker
    class << self
      def perform(line:)
        delete_index = line.index('TODO') || line.index('FIXME')
        return nil if delete_index.nil?

        parse_line = line.slice(delete_index..)

        unless delete_index.zero?
          line.slice!(0..delete_index-1)
        end

        if check_format(line: parse_line).nil?
          return "フォーマットエラー"
        end

        date = parse_line.match(/[0-9]{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])/)[0]
        if check_date(date: date)
          return "期限を過ぎています"
        end

        nil
      end

      private

      def check_format(line:)
        line =~ /\A(TODO|FIXME)\((\w|-)*:[0-9]{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\).*\Z/
      end

      def check_date(date:)
        Date.parse(date) < Date.today
      end
    end
  end
end
