$(document).ready(function() {
  var questions_submit = $('.question-display');

questions_submit.on("submit", function(event){
  event.preventDefault()
  console.log('please work')
  var jqxhr = $.ajax({
      url:  '/survey/question',
      type: 'POST',
      data: $(this).serialize(),

      success: function(data){
        $(".choices-display").html(data)
      },

      fail: function(){
        console.log('fail')
      }
    });
  });


$('.survey-title').submit(function(event) {
    event.preventDefault();

    var jqxhr = $.ajax({
      url:  '/survey',
      type: 'POST',
      data: $(this).serialize(),

      success: function(data){
        $(".question-display").html(data)
      },

      fail: function(){
        console.log('fail')
      }
    });
  });

 })



// function addChoicesDisplay(event) {


//     // event.preventDefault();

//     // var jqxhr = $.ajax({
//     //   url:  '/survey/question',
//     //   type: 'POST',
//     //   data: $(this).serialize(),

//     //   success: function(data){
//     //     $(".choices-display").html(data)
//     //   },

//     //   fail: function(){
//     //     console.log('fail')
//     //   }
//     // });
//   };

