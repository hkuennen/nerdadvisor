import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sound"
export default class extends Controller {
  coin = new Audio("/sounds/coin.mp3");

  connect() {
    this.coin.load();
    this.coin.play();
    this.coin.currentTime = 0;
  }
}
