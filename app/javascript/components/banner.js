import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Experience the speed", "Drive an exotic car today"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
