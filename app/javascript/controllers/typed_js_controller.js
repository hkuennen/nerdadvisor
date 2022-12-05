import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// This is animated scroll


// This is typed text
export default class extends Controller {
  connect() {

    AOS.init({
  duration: 1200,
})
    new Typed(this.element, {
      strings: ["Sound Designer at Ubisoft", "Sketch Artist at Blizzard", "Sales Manager at Bethesda", "Junior Developer at Nintendo"],
      typeSpeed: 50,
      loop: true
    })
  }
}
