import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = [ "xp" ];
  xp = parseInt(this.element.dataset.points, 10);
  levelUp = (this.element.dataset.levelUp === "true");

  connect() {
    const anim = this.xpTargets[0].getAnimations()[0].effect

    anim.setKeyframes(
      [{
        backgroundAttachment: "initial",
        backgroundClip: "initial",
        backgroundColor: "rgb(16, 246, 183)",
        backgroundImage: "initial",
        backgroundOrigin: "initial",
        backgroundPositionX: "initial",
        backgroundPositionY: "initial",
        backgroundRepeatX: "initial",
        backgroundRepeatY: "initial",
        backgroundSize: "initial",
        composite: "auto",
        computedOffset: 0,
        easing: "ease",
        offset: 0,
        width: "0%"
      }, {
        backgroundAttachment: "initial",
        backgroundClip: "initial",
        backgroundColor: "rgb(210, 23, 217)",
        backgroundImage: "initial",
        backgroundOrigin: "initial",
        backgroundPositionX: "initial",
        backgroundPositionY: "initial",
        backgroundRepeatX: "initial",
        backgroundRepeatY: "initial",
        backgroundSize: "initial",
        composite: "auto",
        computedOffset: 1,
        easing: "ease",
        offset: 1,
        width: `${this.xp}%`
      }]
    );

    if (this.xp >= 100) {
      this.levelUp = true;
    }

    if (this.levelUp) {
      console.log("User leveled up!");
      this.levelUpMore();
    }
  }

  levelUpMore() {
    fetch("/levelup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({"levelup": "1"})
    })
    setTimeout(() => location.reload(), 3000);
  }
}
