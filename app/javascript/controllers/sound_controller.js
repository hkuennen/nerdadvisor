import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sound"
export default class extends Controller {
  connect() {
    console.log("sound controller connected!");
  }

  play(e) {
    e.preventDefault();
    console.log("apply button clicked!");
  }
}
