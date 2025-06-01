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
    const currentTheme = document.documentElement.getAttribute("data-theme");
    const id = event.target.id;

    const isAllowed = !(
      (currentTheme === "light" && id === "branding_secondary_color_dark") ||
      (currentTheme === "dark" && id === "branding_secondary_color_light")
    );

    if (isAllowed) {
      this.updateCSSVariable(event.target);
    }
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

  toggleTheme = (e) => {
    const currentTheme = document.documentElement.getAttribute("data-theme");
    const newTheme = currentTheme === "dark" ? "light" : "dark";
    const valueLight = document.getElementById(
      "branding_secondary_color_light"
    ).value;
    const valueDark = document.getElementById(
      "branding_secondary_color_dark"
    ).value;
    const variable = e.target.dataset.variable;

    document.documentElement.setAttribute("data-theme", newTheme);
    localStorage.setItem("theme", newTheme);
    console.log(variable);
    console.log(valueLight);
    console.log(valueDark);

    // If new theme is light mode, than change value of secondarycolor to light else change to dark
    if (newTheme === "light") {
      document.documentElement.style.setProperty(variable, valueLight);
    } else {
      document.documentElement.style.setProperty(variable, valueDark);
    }
  };
}
