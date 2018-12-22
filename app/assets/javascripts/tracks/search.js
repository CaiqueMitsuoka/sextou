const setupTracksButtons = () => {
  const tracks = document.querySelectorAll('a[data-available-track=true]')
  const disableButtons = (event) => {
    event.preventDefault();
    tracks.forEach((track) => {
      track.classList.add('disabled')
    })
  }

  tracks.forEach((track) => {
    track.addEventListener("click", disableButtons)
  })
}

document.addEventListener("DOMContentLoaded", setupTracksButtons)
