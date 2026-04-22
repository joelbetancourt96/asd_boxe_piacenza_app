// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { createApp } from "vue"

document.addEventListener("DOMContentLoaded", () => {
  const navbarApp = document.getElementById("navbar-app");
  if (navbarApp) {
    createApp({
      data() {
        return {
          currentPath: window.location.pathname
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
  } else {
    console.log("Navbar app not found");
  }
})
