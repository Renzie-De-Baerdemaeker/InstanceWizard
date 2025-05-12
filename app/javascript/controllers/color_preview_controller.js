import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-preview"
export default class extends Controller {
  connect() {

  }

  static targets = ["primary", "secondaryLight", "secondaryDark", "accent", "previewLight", "previewDark"]

  update() {
    const primary = this.primaryTarget.value
    const secondaryLight = this.secondaryLightTarget.value
    const secondaryDark = this.secondaryDarkTarget.value
    const accent = this.accentTarget.value

    // Preview light mode
    this.previewLightTarget.style.setProperty("background", secondaryLight)
    this.previewLightTarget.style.setProperty("color", primary)
    this.previewLightTarget.style.setProperty("border", `2px solid ${accent}`)

    // Preview dark mode
    this.previewDarkTarget.style.setProperty("background", secondaryDark)
    this.previewDarkTarget.style.setProperty("color", primary)
    this.previewDarkTarget.style.setProperty("border", `2px solid ${accent}`)
  }
}
