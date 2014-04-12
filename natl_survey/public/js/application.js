$(document).ready(function() {
  $('.toggle').hide();
  var counter = 1
    $('#add_new_question').on('click', function(){
        event.preventDefault();
        $('#questions_go_here').append("Question "+counter+" <input type='text' name='question"+counter+"' placeholder='Which is your favorite movie?' require ><br> Choice 1: <input type='text' name='question"+counter+",text1' required ><br>Choice 2: <input type='text' name='question"+counter+",text2' required ><br>Choice 3: <input type='text' name='question"+counter+",text3' required ><br>Choice 4: <input type='text' name='question"+counter+",text4' required ><br>Choice 5: <input type='text' name='question"+counter+",text5' required ><br><br>");
        counter ++;
    })

  $('.display-chart button').on('click', displayChart)
});

function displayChart(event){
  event.preventDefault;
  var mainDiv = $(this).closest('div')
  console.log(mainDiv)
  $(mainDiv).find('.toggle').first().toggle();
}