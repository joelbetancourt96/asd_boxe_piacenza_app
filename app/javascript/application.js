// app/javascript/application.js
import { createApp } from "vue"

document.addEventListener("DOMContentLoaded", () => {
  const navbarApp = document.getElementById("navbar-app");
  if (navbarApp) {
    createApp({
      data() {
        return {
          currentPath: window.location.pathname,
          isMobileMenuOpen: false
        }
      },
      computed: {
        isHomeActive() {
          return this.currentPath === "/"
        },
        isAboutUsActive() {
          return this.currentPath === "/chi-siamo"
        },
        isCoursesActive() {
          return this.currentPath === "/corsi"
        },
        isContactsActive() {
          return this.currentPath === "/contatti"
        },
        isBoxersActive() {
          return this.currentPath === "/boxers"
        }
      }
    }).mount(navbarApp)
  }
})