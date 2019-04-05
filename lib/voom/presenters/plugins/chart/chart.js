class Chart {
  constructor(element) {
    this.data = JSON.parse(element.dataset.chartOptions);
    if (this.data.axis && this.data.axis.y && this.data.axis.y.tick &&
        this.data.axis.y.tick.format) {
      this.data.axis.y.tick.format = d3.format(this.data.axis.y.tick.format)
    }
    this.chart = c3.generate(Object.assign({bindto: element}, this.data));
  }
}
