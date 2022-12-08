import { Controller } from "@hotwired/stimulus"
import coinSound from "../../assets/coin.mp3"


// Connects to data-controller="sound"
export default class extends Controller {
  coin = new Audio(coinSound);

  connect() {
    this.coin.load();
    this.coin.play();
    this.coin.currentTime = 0;
  }
}
