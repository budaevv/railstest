module GraphHelper

  def make_graph( graph_data , canvas_id , type )
      ("<script>
      (function() {
          jQuery(function() {

              var labelsArr = ["+graph_data.labels.to_s+"];
              var datasArr =  ["+graph_data.datas.to_s+"];

          var data1 = {
              labels: labelsArr,
              datasets: [
                  {
                      fillColor: \"rgba(151,187,205,0.5)\",
                      strokeColor: \"rgba(151,187,205,1)\",
                      pointColor: \"rgba(151,187,205,1)\",
                      pointStrokeColor: \"#fff\",
                      data: datasArr
                  }
              ]
          };

          new Chart($('#"+canvas_id.to_s+"').get(0).getContext('2d'))."+type.to_s+"(data1);

      });

      }).call(this);
      </script> <canvas id="+canvas_id.to_s+" height=\"450\" width=\"1000\"/>").html_safe
  end

end