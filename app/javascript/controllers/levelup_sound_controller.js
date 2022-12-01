import { Controller } from "@hotwired/stimulus"
import levelupSound from '../../assets/sounds/level_up.mp3'

// Connects to data-controller="levelup-sound"
export default class extends Controller {
  levelup = new Audio(levelupSound);

  connect() {
    this.levelup.load();
    this.levelup.play();
    this.levelup.currentTime = 0;
  }
}
