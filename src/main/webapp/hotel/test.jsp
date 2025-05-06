<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.0/nouislider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.0/nouislider.min.js"></script>
</head>
<body>
<div id="app">
  <div class="form-group">
    <div class="range-slider">
      <span>
        <input type="number" :value="minPrice" readonly /> -
        <input type="number" :value="maxPrice" readonly />
      </span>
      <!-- 슬라이더 박스 -->
      <div id="price-slider"></div>
    </div>
  </div>
</div>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script>
  const { createApp, onMounted, ref } = Vue;

  createApp({
    setup() {
      const minPrice = ref(50000);
      const maxPrice = ref(200000);

      onMounted(() => {
        const slider = document.getElementById("price-slider");

        noUiSlider.create(slider, {
          start: [minPrice.value, maxPrice.value],
          connect: true,
          range: {
            min: 50000,
            max: 250000,
          },
          step: 1000,
          tooltips: true,
          format: {
            to: value => Math.round(value),
            from: value => Number(value),
          },
        });

        slider.noUiSlider.on("update", (values) => {
          minPrice.value = parseInt(values[0]);
          maxPrice.value = parseInt(values[1]);
        });
      });

      return {
        minPrice,
        maxPrice,
      };
    },
  }).mount("#app");
</script>
</body>
</html>