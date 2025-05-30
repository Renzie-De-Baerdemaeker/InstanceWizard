import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.colorTargets.forEach((target) => {
      this.updateCSSVariable(target);
    });
  }

  static targets = ["color", "login", "overview"];

  // Switching colors
  update(event) {
    this.updateCSSVariable(event.target);
  }

  updateCSSVariable(colorInput) {
    const variable = colorInput.dataset.variable;
    const color = colorInput.value;

    if (variable && color) {
      document.documentElement.style.setProperty(variable, color);
    }
  }

  // Switching pages
  showLogin() {
    this.loginTarget.classList.remove("hidden");
    this.overviewTarget.classList.add("hidden");
  }

  showOverview() {
    this.loginTarget.classList.add("hidden");
    this.overviewTarget.classList.remove("hidden");
  }

  toggleTheme = () => {
    const currentTheme = document.documentElement.getAttribute("data-theme");
    const newTheme = currentTheme === "dark" ? "light" : "dark";
    document.documentElement.setAttribute("data-theme", newTheme);
    localStorage.setItem("theme", newTheme);
  };
}
