import axios from 'axios'
import { JSDOM } from 'jsdom'

export async function findDom(url) {
  const r = await axios.get(url)
  return new JSDOM(r.data)
}
