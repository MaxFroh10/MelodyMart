// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = ["startTime", "endTime"];

  connect() {
    flatpickr(this.startTimeTarget, {
      dateFormat: "d/m/Y", // Set the date format to DD/MM/YYYY
    });
    flatpickr(this.endTimeTarget, {
      dateFormat: "d/m/Y", // Set the date format to DD/MM/YYYY
    });
  }
}
