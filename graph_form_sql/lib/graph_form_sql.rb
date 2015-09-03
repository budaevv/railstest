require 'graph_form_sql/graph_from_sql_helper'

module GraphFormSql

  class ChartGem

    def self.getdata( sql )
      labels = '';
      datas = '';
      result = ActiveRecord::Base.connection.execute( sql )
      result.each do |row|
        datas = datas +row[0].to_s+','
        labels = labels +' "'+row[1].to_s+'",'
      end
      return ChartData.new(labels,datas);

    end

  end

  class ChartDataGem

    attr_accessor :labels
    attr_accessor :datas

    def initialize(labels , datas)
      @labels = labels
      @datas = datas
    end

  end

  ActionView::Base.send :include, GraphFromSqlHelper

end
