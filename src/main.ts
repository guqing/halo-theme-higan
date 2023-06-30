import 'unfonts.css'
import "./assets/colors/white.css";
import "./assets/colors/light.css";
import "./assets/colors/dark.css";
import "./assets/main.js";
import "./styles/main.css";
import "@purge-icons/generated";
export * from './create-toc'
import Alpine from 'alpinejs'
import momentComment from "./alpine-data/moment-comment";

window.Alpine = Alpine
Alpine.data("momentComment", momentComment);
Alpine.start()