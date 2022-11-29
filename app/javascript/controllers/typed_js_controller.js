import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Sound Designer at Ubisoft", "Sketch Artist at Blizzard", "Sales Manager at Bethesda", "Junior Developer at Nintendo"],
      typeSpeed: 50,
      loop: true
    })
  }
}
