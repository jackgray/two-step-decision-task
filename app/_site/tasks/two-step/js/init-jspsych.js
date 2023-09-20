// Initialize jsPsych.
var jsPsych = initJsPsych({
  override_safe_mode: true,     // LOCAL MODE: true -- prevents CORS errors when using file:// protocol
  use_webaudio: false,          // LOCAL MODE: false -- WebAudioAPI doesn't work offline -- this switches to using HTML5 audio which is not as precise in recording response times relative to the onset of the audio. Is automatically set false by 'override_safe_mode=false'
  on_finish: function() {

    // Add interactions to the data variable
    var interaction_data = jsPsych.data.getInteractionData();
    jsPsych.data.get().addToLast({interactions: interaction_data.json()});

    // Display jsPsych data in viewport.
    //jsPsych.data.displayData();

    // redirect to cute animal picture on completion
    window.location = "https://i.pinimg.com/736x/a9/9a/e9/a99ae98c6d1ecf3f34f9051902b34387--beagles-beagle-puppies.jpg"
  }
});
