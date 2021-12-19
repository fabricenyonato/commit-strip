const axios = require('axios')
const { join, resolve } = require('path')
const { JSDOM } = require('jsdom')
const { writeFileSync, readFileSync, readdirSync } = require('fs')
const { Worker } = require('worker_threads')

function thread(file, data) {
  return new Promise((resolve, reject) => {
    const worker = new Worker(file, { workerData: data })

    worker.on('message', resolve)
    worker.on('error', reject)

    worker.on('exit', code => {
      if (code === 0) resolve(null)

      const error = new Error(`Worker exit with code ${code}`)
      reject(error)
    })
  })
}

async function findUrls() {
  const r = await axios.get('https://www.commitstrip.com/en/sitemap.xml')
  const dom = new JSDOM(r.data)

  const locs = dom.window.document
    .querySelectorAll('sitemap loc')
    .values()

  const promises = Array.from(locs)
    .filter(item => {
      return  item.textContent
        .startsWith('https://www.commitstrip.com/sitemap-pt-post-')
    })
    .map(item => {
      const file = join(resolve(), 'src', 'find-month-urls.js')
      return thread(file, item.textContent)
    })

  const months = await Promise.all(promises)
  let links = []

  for (let month of months)
    links.push(...month)

  return links
}

function findInDom(html) {
  const dom = new JSDOM(html)

  const title = dom.window.document
    .querySelector('head > meta[property="og:title"]')
    .getAttribute('content')

  const thumbnail = dom.window.document
    .querySelector('head > meta[property="og:image"]')
    .getAttribute('content')

  const image = dom.window.document
    .querySelector('#content .entry-content p img')
    .getAttribute('src')

  return {
    title,
    thumbnail,
    image,
  }
}

async function findStrip(url) {
  const r = await axios.get(url)
  const endom = new JSDOM(r.data)

  const id = endom.window.document
    .querySelector('#content article[id^="post-"]')
    .getAttribute('id')
    .split('-')[1]

  const sdate = endom.window.document
    .querySelector('#content header time.entry-date')
    .getAttribute('datetime')
  const date = new Date(sdate)

  const en = findInDom(r.data)

  const frLink = endom.window.document
    .querySelector('li.lang-fr a')
    .getAttribute('href')

  const frr = await axios.get(frLink)
  const fr = findInDom(frr.data)

  return {
    ...en,
    url,
    id,
    date: date.toISOString(),
    langs: {
      fr: {
        ...fr,
        url: frLink
      }
    }
  }
}

async function saveStrip(url) {
  try {
    const strip = await findStrip(url)
    
    writeFileSync(`data/${strip.id}.json`, JSON.stringify(strip))
    
    const savedUrls = JSON.parse(readFileSync('data/urls.json'))
    writeFileSync(`data/urls.json`, JSON.stringify([ url, ...savedUrls ]))
  }
  catch (error) {
    console.log(url)
  }
}

function combine() {
  const files = readdirSync('data')
    .filter(file => ['urls.json', 'commit-strip.json'].includes(file))
    .map(file => {
      const json = readFileSync(`data/${file}`)
      return JSON.parse(json)
    })
    .sort((a, b) => new Date(a.date) - new Date(b.date))

  writeFileSync('data/commit-strip.json', JSON.stringify(files))
}

async function main() {
  // console.time()
  // const urls = await findUrls()
  // console.timeEnd()

  // const savedUrls = JSON.parse(readFileSync('data/urls.json'))

  // const newUrls = urls
  //   .filter(url => !savedUrls.includes(url))

  // console.time()
  // for (let url of newUrls)
  //   await saveStrip(url)
  // console.timeEnd()

  console.time()
  combine()
  console.timeEnd()
}

main()
