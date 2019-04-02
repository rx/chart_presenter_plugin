class Chart {
  constructor(element) {
    this.data = JSON.parse(element.dataset.chartOptions);
    this.chart = c3.generate(Object.assign({ bindto: element }, this.data));
  }
}
