import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Drive an Exotic Car Today"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
