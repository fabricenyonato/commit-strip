const { parentPort, workerData } = require('worker_threads')
// import { findDom } from './utils.js'
const axios = require('axios')
const { JSDOM } = require('jsdom')

async function findDom(url) {
  const r = await axios.get(url)
  return new JSDOM(r.data)
}

async function findMonthUrls(url) {
  const dom = await findDom(url)

  let items = dom.window.document
    .querySelectorAll('url loc')
    .values()

  return Array.from(items)
    .map(item => item.textContent)
}

async function run() {
  const urls = await findMonthUrls(workerData)

  parentPort.postMessage(urls)
  parentPort.close()
}

run()
