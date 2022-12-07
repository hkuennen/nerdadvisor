import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  connect() {
    console.log("Porgress Bar connected");
  }
}
