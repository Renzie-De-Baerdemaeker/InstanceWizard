import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.colorTargets.forEach((target) => {
      this.updateCSSVariable(target);
    });
  }

  static targets = ["color"];

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
}
