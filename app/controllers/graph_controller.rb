require 'graph'

class GraphController < ApplicationController

  # first simplest method to use query and create graph data
  def graph1
    @booksbyyear = Author.find_by_sql("select count(*) c,year from books b left join authors a on a.id=b.author_id group by year order by year")
    @topauthors = Author.find_by_sql("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id order by c desc limit 10")
    @authoravarge =  Author.find_by_sql("select avg(a.c) c ,a.author_id,a.fio from
                                        ( select count(*) c ,author_id ,fio , year from books b left join authors a on a.id=b.author_id  group by b.author_id,year ) a group by a.author_id")
    @booksbyauthor =  Author.find_by_sql("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id")
  end

  # second - optimized method to use ChartGraph class and grap helper to generate view
  def graph2
    @booksbyyear = ChartGraph::getdata("select count(*) c,year from books b left join authors a on a.id=b.author_id group by year order by year" )
    @topauthors = ChartGraph::getdata("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id order by c desc limit 10")
    @authoravarge =  ChartGraph::getdata("select avg(a.c) c ,a.author_id,a.fio from
                                        ( select count(*) c ,author_id ,fio , year from books b left join authors a on a.id=b.author_id  group by b.author_id,year ) a group by a.author_id")
    @booksbyauthor =  ChartGraph::getdata("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id")
  end

  # third method the same as second but using additional gem : grap_form_sql
  def graph3
    @booksbyyear = GraphFormSql::ChartGem.getdata("select count(*) c,year from books b left join authors a on a.id=b.author_id group by year order by year" )
    @topauthors = GraphFormSql::ChartGem.getdata("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id order by c desc limit 10")
    @authoravarge =  GraphFormSql::ChartGem.getdata("select avg(a.c) c ,a.author_id,a.fio from
                                        ( select count(*) c ,author_id ,fio , year from books b left join authors a on a.id=b.author_id  group by b.author_id,year ) a group by a.author_id")
    @booksbyauthor =  GraphFormSql::ChartGem.getdata("select count(*) c ,author_id,fio from books b left join authors a on a.id=b.author_id  group by b.author_id")

  end

end
