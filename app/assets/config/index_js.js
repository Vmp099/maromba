window.addEventListener('DOMContentLoaded', function() {
    var musicPlayer = document.getElementById('musicPlayer');
    var playButton = document.getElementById('playButton');
    var volumeSlider = document.getElementById('volumeSlider');
    var seekSlider = document.getElementById('seekSlider');

    playButton.addEventListener('click', function() {
      if (musicPlayer.paused) {
        musicPlayer.play();
      } else {
        musicPlayer.pause();
      }
    });

    volumeSlider.addEventListener('input', function() {
      musicPlayer.volume = volumeSlider.value;
    });

    seekSlider.addEventListener('input', function() {
      var seekTime = (musicPlayer.duration / 100) * seekSlider.value;
      musicPlayer.currentTime = seekTime;
    });

    musicPlayer.addEventListener('timeupdate', function() {
      var seekPosition = (100 / musicPlayer.duration) * musicPlayer.currentTime;
      seekSlider.value = seekPosition;
    });
  });
