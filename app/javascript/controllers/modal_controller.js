import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dialog"];

  open() {
    this.dialogTarget.classList.add("modal-open");
  }

  close() {
    this.dialogTarget.classList.remove("modal-open");
  }
}
