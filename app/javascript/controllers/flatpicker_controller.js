import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpicker"
export default class extends Controller {
  static values = {datesUnavailable: Array}

  static targets = ["dates", "start", "end"]

  connect() {
    console.log("flatpicker");
    console.log(this.datesTarget)

    flatpickr(".datepicker", {
      disable:
      this.datesUnavailableValue,
      mode:'range',
      inline: true
    });
  }


  changeDate () {
    console.log("changfemen de date")
    console.log(this.datesTarget)
    const dateValue = this.datesTarget.value
    console.log(dateValue)
    console.log(dateValue.split(" to "))
    this.startTarget.value = dateValue.split(" to ")[0]

    this.endTarget.value = dateValue.split(" to ")[1]



    // let startDate = (this.startDateTarget.value = value.split("to") [1]);
    // let endDate = (this.endDateTarget.value = value.split("to") [2]);
    // let result = endDate - startDate
  }
}
