
const x = document.querySelector(".xp").getAnimations()[0];
let xpPoints = 25;

x.effect.setKeyframes(
[{
  backgroundAttachment: "initial",
  backgroundClip: "initial",
  backgroundColor: "red",
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
  backgroundColor: "green",
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
  width: `${xpPoints}%`
}]
)

console.log(x.effect.getKeyframes());

