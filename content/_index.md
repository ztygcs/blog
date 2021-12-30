---
title: ' '
badge: false
dropCap: false
share: false
gitinfo: false
---

<!-- {{< align center "**风筝飞得很高**" >}}
{{< align center "**是我从未爬上去过的高度**" >}} -->

<!-- 时钟样式写在blog/assets/scss/custom/_clock.scss中 -->
<div class="home_clock">
<svg width="200" height="200" viewBox="-100 -100 200 200" >
  <circle class="minute_marker" r="90" pathLength="60" />
  <circle class="hour_marker" r="90" pathLength="60" />
  <text id="clock_text" class="clock_text" x="45" y="5"></text>

  <g id="hour_hand">
    <line class="hand" x1="0" y1="0" x2="0" y2="-50" />
    <line class="hand hand--thick" x1="0" y1="-12" x2="0" y2="-50" />
  </g>
  <g id="minute_hand">
    <line class="hand" x1="0" y1="0" x2="0" y2="-80" />
    <line class="hand hand--thick" x1="0" y1="-12" x2="0" y2="-80" />
  </g>
  <g id="second_hand">
    <line class="hand hand--second" x1="0" y1="12" x2="0" y2="-80" />
  </g>
  <circle class="center" r="3" />
</svg>
</div>

<script>
const textElement = document.getElementById("clock_text");
const hoursElement = document.getElementById("hour_hand");
const minutesElement = document.getElementById("minute_hand");
const secondsElement = document.getElementById("second_hand");

let showDate = true;

function animate() {
  const date = new Date();
  const day = date.getDate();
  const ampm = date.getHours() >= 12 ? "PM" : "AM";
  const hour = date.getHours() + date.getMinutes() / 60;
  const minute = date.getMinutes() + date.getSeconds() / 60;
  const second = date.getSeconds() + date.getMilliseconds() / 1000;

  textElement.textContent = showDate ? day : ampm;
  hoursElement.setAttribute("transform", `rotate(${(360 / 12) * hour})`);
  minutesElement.setAttribute("transform", `rotate(${(360 / 60) * minute})`);
  secondsElement.setAttribute("transform", `rotate(${(360 / 60) * second})`);

  requestAnimationFrame(animate);
}

requestAnimationFrame(animate);

textElement.addEventListener("click", () => {
  showDate = !showDate;
});

</script>
