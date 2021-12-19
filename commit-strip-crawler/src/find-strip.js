const { findDom } = require('./utils.js')
const { parentPort, workerData } = require('worker_threads')

function findTitle(dom) {
  return dom.window.document
    .querySelector('head > meta[property="og:title"]')
    .getAttribute('content')
}

function findThumbnail(dom) {
  return dom.window.document
    .querySelector('head > meta[property="og:image"]')
    .getAttribute('content')
}

function findImage(dom) {
  return dom.window.document
    .querySelector('#content .entry-content p img')
    .getAttribute('src')
}

function findId(dom) {
  return dom.window.document
    .querySelector('#content article[id^="post-"]')
    .getAttribute('id')
    .split('-')[1]
}

function findDate(dom) {
  const date = dom.window.document
    .querySelector('#content header time.entry-date')
    .getAttribute('datetime')

  return (new Date(date)).toISOString()
}

function findFrUrl(dom) {
  return dom.window.document
    .querySelector('li.lang-fr a')
    .getAttribute('href')
}

function findAttributes(dom) {
  return {
    title: findTitle(dom),
    thumbnail: findThumbnail(dom),
    image: findImage(dom),
  }
}

async function findStrip(url) {
  const endom = await findDom(url)

  const id = findId(endom)
  const date = findDate(endom)

  const frUrl = findFrUrl(endom)
  const frdom = await findDom(frUrl)

  const en = findAttributes(endom)
  const fr = findAttributes(frdom)

  return {
    id,
    url,
    date,
    ...en,
    langs: {
      fr: {
        ...fr,
        url: frUrl,
      }
    }
  }
}

async function run() {
  const strip = await findStrip(workerData)

  parentPort.postMessage(strip)
  parentPort.close()
}

run()
