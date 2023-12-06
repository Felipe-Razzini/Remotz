import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="musics"
export default class extends Controller {
  static targets = ["form", "input", "list"]
  connect() {
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
    // console.log(this.listTarget)
  }

  update() {
    // console.log("TODO: send request in AJAX")
    const url = `https://spotify-web2.p.rapidapi.com/search/?q=${this.inputTarget.value}&type=multi&offset=0&limit=10&numberOfTopResults=5`
    fetch(url, {
      headers: {
        'X-RapidAPI-Key': ENV['OPEN_SPOTIFY_KEY'],
        'X-RapidAPI-Host': 'spotify-web2.p.rapidapi.com'}})
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        let playlists = "<div class='music-grid'>"
        data["playlists"]["items"].forEach((playlist) => {
          playlists += `<iframe style="border-radius:12px" src="https://open.spotify.com/embed/${playlist["data"]["uri"].split("spotify:").pop().replace(":","/")}?utm_source=generator" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>`
        })
        playlists += '</div>'
        this.listTarget.innerHTML= playlists
    })
  }
}
