$(document).ready(function() {
  var counter = 1
    $('#add_new_question').on('click', function(){
        event.preventDefault();
        $('#questions_go_here').append("Question "+counter+" <input type='text' name='question"+counter+"' placeholder='Which is your favorite movie?' require ><br> Choice 1: <input type='text' name='question"+counter+",text1' required ><br>Choice 2: <input type='text' name='question"+counter+",text2' required ><br>Choice 3: <input type='text' name='question"+counter+",text3' required ><br>Choice 4: <input type='text' name='question"+counter+",text4' required ><br>Choice 5: <input type='text' name='question"+counter+",text5' required ><br><br>");

        counter ++;

    })


  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

// Question <input type='text' name='question'+i'' placeholder='Which is your favorite movie?' require <br>
//           Choice 1 <input type='text' name='question'i',text1'required ><br>
//           Choice 2 <input type='text' name='question'i',text2'required ><br>
//           Choice 3 <input type='text' name='question'i',text3'required ><br>
//           Choice 4 <input type='text' name='question'i',text4'required ><br>
//           Choice 5 <input type='text' name='question'i',text5'required ><br>