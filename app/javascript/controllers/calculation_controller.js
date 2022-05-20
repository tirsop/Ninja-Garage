// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["days", "total", "startDate", "returnDate", "price"]

  connect() {
    console.log("connected")
    console.log(this.daysTarget)
    console.log(this.totalTarget)
    console.log(this.startDateTarget)
    console.log(this.returnDateTarget)
  }
  calculate() {
    const startDate = new Date(this.startDateTarget.value)
    const returnDate = new Date(this.returnDateTarget.value)
    const rentalDays = (returnDate - startDate) / (1000 * 3600 * 24) + 1
    const totalPrice = rentalDays * parseInt(this.priceTarget.innerText)
    this.daysTarget.innerText = rentalDays
    this.totalTarget.innerText = totalPrice
    console.log(startDate)
    console.log(rentalDays)

  }
}
