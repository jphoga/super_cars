import "bootstrap";
import "../plugins/flatpickr";

console.log("Hello from packs");

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { autocomplete } from '../components/autocomplete';
autocomplete();
